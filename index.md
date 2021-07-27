---
title: Guides to finding IIIF resources
layout: page
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
---

This is a brief guide to finding IIIF Manifest URLs from members of the IIIF community.  These guides begin from a record page, so do not include how to search or view an individual record.

Once you have a manifest URL you can use the [How to use IIIF Resources and Viewers](https://medium.com/@IIIF_io/how-to-use-iiif-resources-and-image-viewers-bd378a68b013) guide to open it in one of the many IIIF Viewers. 

This site is a work in progress and we are working to transfer all of the institution's from the St Andrews list which was an inspiration for this site:

 * St Andrew's [IIIF Resources List](https://www.st-andrews.ac.uk/assets/university/library/documents/IIF%20resources.pdf)

"Copy this link" is the final step in many of the guides and this involves right-clicking and "copy link address" or similar. Alternatively left click to open the link, then copy the address in the address bar. 

## Contribution and corrections

If you notice a correction or would like to add to this list please either submit a pull request to [the repository](https://github.com/IIIF/guides) or fill in  [this Google form](https://forms.gle/S6LLjBy2o4iEBR8C9) and the IIIF Staff will add your entry. If you are submitting through GitHub please read the [Contributing](CONTRIBUTING/) guide.

## Collections

<ul>
  {% assign locations = site.pages %}
  {% assign sorted = locations | sort_natural: "title" %}
  {% for file in sorted %}
    {% if file.path contains 'guides' and file.name != 'template.md' %} 
      <li>
        <a href="{{site.url}}{{site.baseurl}}{{file.url}}">{{ file.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>
