---
title: Guides to Finding IIIF Resources
layout: page
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
breadcrumbs:
 - label: Get Started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: '/'
---

This is a brief guide to finding IIIF Manifest URLs from members of the IIIF community.  These guides begin from a record page, so do not include how to search or view an individual record.

Once you have a manifest URL you can use the [How to use IIIF Resources and Viewers]({{ site.guides_url | absolute_url }}/using_iiif_resources/) guide to open it in one of the many IIIF Viewers. 

This site is a work in progress, and heavily inspired by the initial work done by St Andrew's University to compile the initial [IIIF Resources List](https://www.st-andrews.ac.uk/assets/university/library/documents/IIF%20resources.pdf).

"Copy this link" is the final step in many of the guides and this involves right-clicking and "copy link address" or similar. Alternatively left click to open the link, then copy the address in the address bar. 

## Contribution and corrections

If you notice a correction or would like to add to this list please either submit a pull request to [the repository](https://github.com/IIIF/guides) or fill in  [this Google form](https://forms.gle/S6LLjBy2o4iEBR8C9) and the IIIF Staff will add your entry. If you are submitting through GitHub please read the [Contributing]({{ site.guides_url |absolute_url }}/CONTRIBUTING/) guide.

## Collections
<ul>
  {% assign locations = site.pages %}
  {% assign sorted = locations | sort_natural: "title" %}
  {% for file in sorted %}
    {% if file.path contains 'guides' and file.name != 'template.md' %} 
      <li>
        <a href="{{ site.guides_url | append: file.url |  absolute_url}}">{{ file.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>
