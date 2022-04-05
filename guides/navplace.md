---
title: How to Use the navPlace Extension With Leaflet
id: using_navplace
layout: spec
author: Bryan Haberberger
breadcrumbs:
 - label: Get started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: '/'
redirect_from:
  '{{ site.guides_url }}/guides/iiif.io.api.extension.navplace/'

---

The IIIF Presentation API 3 was extended and now includes a property called `navPlace`. This property contains geographic coordinates in the form of [GeoJSON-LD](https://geojson.org/geojson-ld/). This guide will show how to include this property within a IIIF Manifest, and then demonstrate how to process and display the information from the `navPlace` property using the JS library.  

## Why Leaflet?
Leaflet is one of the most widely used and easy to understand javascript web mapping libraries. With excellent API documentation, tutorial materials and broad browser compatibility, using Leaflet as the base will offer the most understandable instructions to a large audience. You can learn more about Leaflet at [https://leafletjs.com/](https://leafletjs.com/).

## I want to know more about the `navPlace` property.
In simple terms, `navPlace` is used to supply geographic coordinates pertinent to a resource. Note that the coordinates do not imply any level of accuracy, temporality, or state of existence. You can read more about the `navPlace` property on the [IIIF Presentation API 3 extension page](https://iiif.io/api/extension/navplace/).

## Set up an HTML page with Leaflet
This [Leaflet Quickstart Guide](https://leafletjs.com/examples/quick-start/) was used as a basis for this guide, and should be viewed at your convenience to learn more about the tools Leaflet has to offer.

1. Generate a new basic HTML page with a specific container element for Leaflet.  Make sure to include the leaflet.css and leaflet.js script.

    ```html
    <html>
        <head>
            <title>Leaflet Example</title>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="...leaflet.css"/>
            <script src="...leaflet.js"></script>
        </head>
        <body>
            <div id="leafletInstanceContainer"></div>
        </body>
    </html>
    ```

2. Generate a Manifest that contains navPlace.  In this example, we expect the geographic coordinates will be a FeatureCollection containing a single 'Point' Feature.  

    ```json
    {
      "@context": [
        "http://iiif.io/api/extension/navPlace-context/context.json",
        "http://iiif.io/api/presentation/3/context.json"
      ],
      "id": "http://www.example.org/manifest/1.json",
      "type": "Manifest",
      "label": {
        "en": [
          "Manifest Label"
        ]
      },
      "items": [
        {
          "id": "http://www.example.org/canvas/1.json",
          "type": "Canvas",
          .
          .
          .
        }
      ],
      "navPlace": {
        "type": "FeatureCollection",
        "features": [
          {
            "id": "http://www.example.org/geojson/1.json",
            "type": "Feature",
            "properties": {
              "label": {
                "en": [
                  "Label to see in the Leaflet pop-up."
                ]
              },
              "summary": {
                "en": [
                  "Summary to see in the Leaflet pop-up"
                ]
              }
            },
            "geometry": {
              "type": "Point",
              "coordinates": [
                9.9374867,
                51.53345
              ]
            }
          }
        ]
      }
    }
    ```

3. Add Leaflet script to HTML page.
 
    ```html
    <html>
        <head>
            <title>Leaflet Example</title>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="...leaflet.css"/>
            <script src="...leaflet.js"></script>
        </head>
        
        <body>
            <div id="leafletInstanceContainer"></div>
        </body>
        
        <script>
          let manifest = {...}
          initializeLeaflet(manifest)
          /**
            Initialize the Leaflet Map.  The map will need to know the GeoJSON from navPlace to draw it. For example purposes, this function assumes you are passing in the resolved manifest object as a parameter.
          */
          function initializeLeafletMap(manifestObject){
            //[12,12] is in central Africa and functions as a good focal point when Leaflet initializes zoomed out.
            let startingCoords = [12,12]
            let mymap = L.map('leafletInstanceContainer')
            let leafletOptions = 
            {
              attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
              maxZoom: 19
            }
            /**
              Supply the Tile layer you want to use, as well as other options.
              Find tile layers at http://leaflet-extras.github.io/leaflet-providers/preview/
             + */
            L.tileLayer(
              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
              leafletOptions
            ).addTo(mymap)
            mymap.setView(startingCoords,2)
    
            //Add the GeoJSON from the Manifest object
            L.geoJSON(manifestObject.navPlace, {
                pointToLayer: function (feature, latlng) {
                    let appColor = "#08c49c"
                    return L.circleMarker(latlng, {
                        radius: 8,
                        fillColor: appColor,
                        color: "#000",
                        weight: 1,
                        opacity: 1,
                        fillOpacity: 0.8
                    });
                },
                onEachFeature: pointEachFeature
            }).addTo(mymap)
          }
    
          /**
             A helper function for Leaflet.  Leaflet sees GeoJSON objects as "features".  This function says what to do with each feature when adding the feature to the map.  Here is where you detect what metadata appears in the pop-ups.  For our purposes, we assume the metadata you want to show is in the GeoJSON 'properties' property.  Our 'label' and 'summary' will be formatted as language maps, since they are most likely coming directly from a IIIF resource type and IIIF Presentation API 3 requires 'label' and 'summary' to be formatted as a language map.
          */
          function pointEachFeature(feature, layer){
             if (feature.properties) {
                if(feature.properties.label.en) {
                    //Oh no is the label you want in the Manifest?  Get it like... 
                    //popupContent += `<div><label>Label:</label>${manifest.label.en}</div>`

                    popupContent += `<div><label>Label:</label>${feature.properties.label.en}</div>`
                }
                if(feature.properties.summary.en) {
                    popupContent += `<div><label>Summary:</label>${feature.properties.summary.en}</div>`
                }
            }
            layer.bindPopup(popupContent);
          }
        </script>
    </html>
    ```

That's it!  Now when this HTML page loads, it will initialize the Leaflet map with the FeatureCollection found in the `navPlace` property of this Manifest.  Below you will see the code implemented! You should see a Leaflet load up, zoomed out pretty far, with a single greenish Point drawn in Germany. Click on the point to see your metadata!

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
crossorigin=""></script>
<div style="font-weight: bold;">
    <a href="https://guides.iiif.io/">IIIF Guides</a> #41 Leaflet Example
</div>
<div id="leafletInstanceContainer" style="height:28em; max-width:68em;"></div>
<script>
  //A crude and quickly made Manifest with an empty Canvas.
  let manifestObj = {
    "@context": [
      "http://iiif.io/api/extension/navPlace-context/context.json",
      "http://iiif.io/api/presentation/3/context.json"
    ],
    "id": "http://www.example.org/manifest/1.json",
    "type": "Manifest",
    "label": {
      "en": [
        "Manifest Label"
      ]
    },
    "items": [
      {
        "id": "http://www.example.org/canvas/1.json",
        "type": "Canvas",
        "label": {
        "en": [
          "Canvas Label"
        ]
      }
      }
    ],
    "navPlace": {
      "type": "FeatureCollection",
      "features": [
        {
          "id": "http://www.example.org/geojson/1.json",
          "type": "Feature",
          "properties": {
            "label": {
              "en": [
                "Label to see in the Leaflet pop-up."
              ]
            },
            "summary": {
              "en": [
                "Summary to see in the Leaflet pop-up"
              ]
            }
          },
          "geometry": {
            "type": "Point",
            "coordinates": [
              9.9374867,
              51.53345
            ]
          }
        }
      ]
    }
  }
  initializeLeafletMap(manifestObj)

  function initializeLeafletMap(manifestObject){
    let startingCoords = [12,12]
    let mymap = L.map('leafletInstanceContainer') 
    L.tileLayer(
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        maxZoom: 19,
        worldCopyJump: true,
        retina: '@2x',
        detectRetina: false
      }
    ).addTo(mymap)
    mymap.setView(startingCoords,2);

    //Add the GeoJSON from the Manifest object (manifestObject["navPlace"])
    L.geoJSON(manifestObject.navPlace, {
        pointToLayer: function (feature, latlng) {
            let appColor = "#08c49c"
            return L.circleMarker(latlng, {
                radius: 8,
                fillColor: appColor,
                color: "#000",
                weight: 1,
                opacity: 1,
                fillOpacity: 0.8
            });
        },
        onEachFeature: pointEachFeature
    }).addTo(mymap)
  }

  function pointEachFeature(feature, layer){
    let popupContent = ``
     if (feature.properties) {
        if(feature.properties.label.en) {
            popupContent += `<div><label>Label:</label>${feature.properties.label.en}</div>`
        }
        if(feature.properties.summary.en) {
            popupContent += `<div><label>Summary:</label>${feature.properties.summary.en}</div>`
        }
    }
    layer.bindPopup(popupContent)
  }
</script>

You can also [go to the example page](example.html) to see it on its own.

## Quick links
Below is a non-exhaustive list of popular web mapping platforms that are similar to Leaflet and have similar set up procedures. They offer a variety of tools for people interested in using maps on the web.  
 * [OpenLayers](https://openlayers.org/)
 * [Project Mirador](https://projectmirador.org/)
 * [Apple Maps](https://www.apple.com/maps/)
 * [Google Maps](https://www.google.com)
 * [Mapbox](https://www.mapbox.com/)
 * [MapQuest](https://www.mapquest.com/)
 * [Geosandbox](https://joeyklee.github.io/geosandbox/)

