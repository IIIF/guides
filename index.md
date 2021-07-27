---
title: Guides 
layout: page
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"

breadcrumbs:
 - label: Get Started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: index.html

end_user_cards:
  - label: Find IIIF resources
    description: Discover IIIF-enabled materials from institutions around the world.
    image: ''
    link: '{{ site.guides_url | absolute_url}}/finding_resources/'
    alt: 'test'
  - label: Use IIIF resources
    description: Use preexisting IIIF-enabled materials for teaching and research across sites and tools.
    image: ''
    link: '{{ site.guides_url | absolute_url}}/using_iiif_resources/'
---

Intro explaining what guides is....

{{ theme.block-center-start }}

{% include blocks/cards.html items=page.end_user_cards %}

{{ theme.block-end }}

