---
title: Guides 
layout: default
subtitle: A set of resources to help you find and work with IIIF materials, built by members of the IIIF community
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
breadcrumbs:
 - label: Get Started
   link: '{{ site.root_url | absolute_url}}/get-started'
guide_cards:
  - label: Find IIIF Resources
    description: Discover IIIF-enabled materials from institutions around the world.
    image: ''
    link: '/finding_resources/'
    alt_text: 'test'
  - label: How to Use IIIF Viewers
    description: Learn how to use IIIF materials in a variety of viewers for teaching, research across sites, and more.
    image: ''
    link: '/using_iiif_resources/'
additional_cards:
  - label: IIIF Online Training Course
    description: Open access training materials covering the Image and Presentation APIs as well as annotating images, among other topics.
    image: ''
    link: '{{ site.root_url | absolute_url}}/get-started/training/'
    alt_text: 
  - label: Non-English IIIF Resources
    description: A variety of tutorials, videos, and tools source from many countries within the IIIF community. 
    image: ''
    link: '{{ site.root_url | absolute_url }}/get-started/non-english/'
    alt_text: 
  - label: IIIF Image playground
    description: Try changing some of the parameters of a URL to see exactly how the IIIF Image API works. 
    image: ''
    link: https://www.learniiif.org/image-api/playground
    alt_text: 
implementer_cards:
  - label: Guide for IIIF Implementers
    description: This brief guide will lead you through some of the decision points to help get you going with IIIF.
    image: ''
    link: /guide_for_implementers/
    alt_text: 

---

{{ theme.block-center-start }}

## Guides to Finding and Working with IIIF Materials

{% include blocks/cards.html items=page.guide_cards %}

{{ theme.block-end }}

{{ theme.block-center-start }}

## Guides for Implementers Considering IIIF

{% include blocks/cards.html items=page.implementer_cards %}

{{ theme.block-end }}

{{ theme.block-center-start }}


## Other Tutorials and Guides of Interest

{% include blocks/cards.html items=page.additional_cards %}

{{ theme.block-end }}

