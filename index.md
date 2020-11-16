# IIIF resources

This is a brief guide to finding IIIF Manifest URLs on the IIIF community websites.  These guides begin from a record page, so do not include how to search or view an individual record.

"Copy this link" is usually the final step, thisinvolves right-clicking and "copy link address" or similar. Alternatively left click to open the link, then copy the address in the address bar.

<ul>
  {% assign locations = site.pages %}
  {% assign sorted = locations | sort:"title" %}
  {% for file in sorted %}
    {% if file.path contains 'location' %} 
      <li>
        <a href="{{file.url}}">{{ file.title }}</a>
      </li>
    {% endif %}
  {% endfor %}
</ul>
