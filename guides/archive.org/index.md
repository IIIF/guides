---
title: Internet Archive
# One of: no, full or associate
consortium: associate
homepage: https://archive.org/
layout: guide
---

# Introduction
This guide covers both using IIIF to interact with Internet Archive items and using the Internet Archive as a IIIF enabled digital asset management system for your own items.

## IIIF for existing Internet Archive Items

### Finding the IIIF manifest for an item
1. Search for the item and visit the record page, i.e. https://archive.org/details/b29000427_0001/page/n13/mode/2up.
2. Copy the identifier for record. It's always right after "details".  In the above example it's `b29000427_0001`
3. Place that identifier into the following URL structure: https://iiif.archive.org/iiif/:id/manifest.json.  
Our example becomes: https://iiif.archive.org/iiif/b29000427_0001/manifest.json

### Using the IIIF Helpers on Internet Archive
There are also IIIF helper tools available on the Internet Archive that make it much easier to work with different types of items from the Internet Archive.
The URL structure for the helper tool looks like:

https://iiif.archive.org/iiif/helper/:id/  

Replace the :id with the identifier for the record.

![Internet Archive Presentation API Audio Helper](ia_audio_helper.png)

IIIF helpers are available for images, books, and A/V items.


