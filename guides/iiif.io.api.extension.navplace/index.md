---
title: How to Use navPlace With Leaflet
id: using_navplace
layout: spec
author: thehabes
date: Last updated 2022-02-03

---

The IIIF Presentation API (3) was recently extended with a property called `navPlace`. This property contains geographic coordinates in the form of GeoJSON-LD. This guide will show how to place this property onto a Manifest, then use a Leaflet script to ingest the geographic coordinates from the Manifest.  

## Why Leaflet?
Leaflet is one of the most well known and easy to understand web mapping platforms. Once you know how to set one up, you know how to set more up.  Using Leaflet as the base will offer the most understandable instructions to a large audience.  You can learn more about Leaflet at [https://leafletjs.com/](https://leafletjs.com/).

## I want to know more about the `navPlace` property.
In simple terms, `navPlace` is used to supply geographic coordinates pertinent to a resource. Note that the coordinates do not imply any level of accuracy, temporality, or state of existence. You can read more about the `navPlace` property on the [IIIF Presentation API (3) extension page](https://iiif.io/api/extension/navplace/).

## Set up an HTML page with Leaflet
This is a simplified interpretation of the [Leaflet Quickstart Guide](https://leafletjs.com/examples/quick-start/).
1. Generate a new basic HTML page with a specific container element for Leaflet.  Make sure to include the leaflet.css and leaflet.js script.
 ```html
<html>
    <head>
        <title>Leaflet Example</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
	     integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
	     crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
		   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
		   crossorigin=""></script>
    </head>
    
    <body>
        <div id="leafletInstanceContainer"></div>
    </body>
    
    <script>

    </script>
</html>

 ```
2. Generate a Manifest that contains navPlace.  In this example, we expect the geographic coordinates will be a FeatureCollection containsing a single 'Point' Feature.  
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
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
	     integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
	     crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
		   integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
		   crossorigin=""></script>
    </head>
    
    <body>
        <div id="leafletInstanceContainer"></div>
    </body>
    
    <script>
    let manifest = {...}
    initializeLeaflet(manifest)
    /**
     * Initialize the Leaflet Map.
     * The map will need to know the GeoJSON from navPlace to draw it. For example purposes, this function assumes you are passing in the resolved manifest object as a parameter.  In reality, you may need to fetch() it first, or may even plan to supply them after initializing the Leaflet map.
     * */
    	function initializeLeafletMap(manifestObject){
    		let startingCoords = [12,12]
    		let mymap = L.map('leafletInstanceContainer')
		    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
			    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
			    maxZoom: 18,
			    id: 'mapbox.satellite',
			    accessToken: 'your.mapbox.access.token'
			}).addTo(mymap);
		    mymap.setView(startingCoords,2);
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
    	 * A helper function for Leaflet.  Leaflet sees GeoJSON objects as "features".  This function says what to do with each feature when adding to the map.  This is where you supply the HTML or plain text containing the metadata you wish to show.  Here we are looking for a "label" and "summary".
    	 * */
    	function pointEachFeature(feature, layer){
    		//Here is where you detec what metadata appears in the pop-ups.  For our purposes here, we assume the metadata you want to show is in the GeoJSON 'properties` property.  Our 'label' and 'summary' will be formatted as language maps, since they are most likely coming directly from a IIIF resource type and IIIF Presentation API 3 requires 'label' and 'summary' to be formatted as language maps.
    		 if (feature.properties) {
		        if(feature.properties.label.en) {
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

That's it!  Now when this HTML page loads, it will initialize the Leaflet map with the Feature or FeatureCollection found in the `navPlace` property of this Manifest.  You should see a Leaflet load up, zoomed out pretty far, with a single greenish Point drawn in Germany. Click on the point to see your metadata!


## Quick links

Below is a list of popular web mapping platforms that are similar to Leaflet that have similar set up procedurs

 * [Google Maps](https://projectmirador.org/)
 * [OpenStreetMap](https://www.google.com)
 * 

