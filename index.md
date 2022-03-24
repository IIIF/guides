---
title: Guides 
layout: default
subtitle: A set of resources to help you find and work with IIIF materials, built by members of the IIIF community
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
breadcrumbs:
 - label: Get started
   link: '{{ site.root_url | absolute_url}}/get-started'
guide_cards:
  - label: Find IIIF resources
    description: Discover IIIF-enabled materials from institutions around the world.
    link: '/finding_resources/'
  - label: How to use IIIF viewers
    description: Learn how to use IIIF materials in a variety of viewers for teaching, research across sites, and more.
    link: '/using_iiif_resources/'
additional_cards:
  - label: Learn the basics of how IIIF works
    description: Read our plain language description of IIIF technology.
    link: '{{ site.root_url | absolute_url }}/get-started/how-iiif-works'
  - label: IIIF online training course
    description: Open access training materials covering the Image and Presentation APIs as well as annotating images, among other topics.
    link: '{{ site.root_url | absolute_url}}/get-started/training/'
  - label: Non-English IIIF Resources
    description: A variety of tutorials, videos, and tools source from many countries within the IIIF community. 
    link: '{{ site.root_url | absolute_url }}/get-started/non-english/'
  - label: IIIF image playground
    description: Try changing some of the parameters of a URL to see exactly how the IIIF Image API works. 
    link: https://www.learniiif.org/image-api/playground
implementer_cards:
  - label: Guide for IIIF implementers
    description: This brief guide will lead you through some of the decision points to help get you going with IIIF.
    link: '/guide_for_implementers/'
  - label: How to Use the navPlace Extension With Leaflet
    description:  This guide will show how to use the navPlace property to connect geographic coordinates with IIIF manifests.
    link: '{{ site.guides_url }}/guides/navplace/'
---

{{ theme.block-center-start }}

## Guides to finding and working with IIIF materials

{% include blocks/cards.html items=page.guide_cards %}

{{ theme.block-end }}

{{ theme.block-center-start }}

## Technical guides for implementers

{% include blocks/cards.html items=page.implementer_cards %}

{{ theme.block-end }}

{{ theme.block-center-start }}


## Other tutorials and guides of interest

{% include blocks/cards.html items=page.additional_cards %}

{{ theme.block-end }}

