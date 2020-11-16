---
title: IIIF Resources
---

This is a brief guide to finding IIIF Manifest URLs on the IIIF community websites.  These guides begin from a record page, so do not include how to search or view an individual record.

"Copy this link" is usually the final step, this involves right-clicking and "copy link address" or similar. Alternatively left click to open the link, then copy the address in the address bar.

## Contribution and corrections

If you notice a correction or would like to add to this lists please either submit a pull request to [the repository](todo) for fill in the [this Google form](todo) and the IIIF Staff will add your entry. 

## Collections

<ul>
  {% assign locations = site.pages %}
  {% assign sorted = locations | sort:"title" %}
  {% for file in sorted %}
    {% if file.path contains 'location' and file.name != 'template.md' %} 
      <li>
        <a href="{{file.url}}">{{ file.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>
