---
title: Thinking about IIIF and SEO
layout: spec
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
breadcrumbs:
 - label: Get started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: '/'
---

When institutions are considering the adoption of IIIF for their digitized collections there are often questions about what, if any, impact IIIF images and viewers will have when it comes to visibility in search engines. 

These questions are primarily tied to web development and design best practices, but there are some useful factors to think through when it comes to IIIF implementation. This document, while far from comprehensive, is meant to help guide you through some of these considerations.

## **IIIF and SEO**

SEO (Search Engine Optimization) “[is the process of making a website more visible in search results, also termed improving search rankings.](https://developer.mozilla.org/en-US/docs/Glossary/SEO)”

Generally speaking, when people talk about SEO in the context of IIIF, they want to make sure their digitized assets are visible to the major search engines (especially Google) and served as results for relevant search terms. They want an answer to the question "How do I help people to find my digital objects that are made available using a IIIF viewer on my site, using common search engines?"

In this context, IIIF is neither the “answer” to SEO concerns, nor an impediment – what matters is what you do on your web pages that present IIIF resources to people. Some of the information for the page might come from the IIIF resource directly, but most likely it comes from the system that also makes the IIIF resource available. We can break these down into some simple recommendations.

### **Ensure your information is in the page, not only in the data.**

Search engines do not generally retrieve JSON or other data which might be pulled in by a JavaScript application, and thus you need to ensure that the information in the JSON is also available to a machine that does not process the JavaScript at all by including it in the HTML. This is also good practice for building applications for humans as well as machines.

### **Ensure your URLs are granular and descriptive.**

Each item that you want to appear in the search engine results should have its own URL. Typically these pages will have keywords from the title of the object as a "slug" at the end of the URL, to increase the relevancy in the search engine's index. If you have useful information for resources that are more granular than a Manifest, you might consider also having separate pages for these.

### **Ensure your information is also structured and semantic.**

You should follow [general SEO practices](https://developers.google.com/search/docs/beginner/seo-starter-guide) like using good titles, adding descriptions, and adding structured data using Schema.org. It is worth noting that Schema.org supports the expression of granular metadata about the types of objects often represented via IIIF resources, for example via the class [CreativeWork](https://schema.org/CreativeWork) and its subclasses ([Book](https://schema.org/Book), [Manuscript](https://schema.org/Manuscript), [Map](https://schema.org/Map), [Painting](https://schema.org/Painting), etc). You can use external files such as sitemaps and robots.txt files to guide crawlers in the right directions.

As you can see, the data in the IIIF resources like Manifests and Annotations is mostly _orthogonal_ to the data which search engines will use to make the pages discoverable. The information may be the same, and is very likely to come from the same underlying database, but will not be used as-is by search engines and needs to be put in a form that is easy for them to find and process.