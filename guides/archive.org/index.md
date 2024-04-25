---
title: Internet Archive
# One of: no, full or associate
consortium: associate
homepage: https://archive.org/
layout: guide
---

1. Search for the item and visit the record page
2. Copy the identifier for record
If the item is https://archive.org/details/b29000427_0001/page/n13/mode/2up
Then the identifier is b29000427_0001 (it’s always right after “details”)
3. Place that identifier into the following URL structure:
https://iiif.archive.org/iiif/:id/manifest.json
So the URL becomes:
https://iiif.archive.org/iiif/3/b29000427_0001/manifest.json

There's also a IIIF helper tool available on the Internet Archive that make it much easier to work with different types of items from the Internet Archive.
The URL structure for the helper tool looks like:

https://iiif.archive.org/iiif/helper/img-8664_202009/  
Replace “img-8664_202009” with your identifier
This works for images, books, and A/V items.


