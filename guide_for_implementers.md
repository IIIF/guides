---
title: Guide for IIIF implementers
layout: spec
hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"
breadcrumbs:
 - label: Get started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: '/'
---

So you’ve been [convinced of the benefits of the International Image Interoperability Framework]({{ site.root_url | absolute_url }}/get-started/why-iiif/), and you’re ready to pursue implementing IIIF (pronounced “triple eye eff”) for your own resources. This brief guide will lead you through some of the decision points to help get you going.


## Community

The IIIF community has developed various options for implementing the standards based on different technical and user needs. For your own institution it is likely that solutions already exist or someone else has needed to do similar.

While this short guide and other documentation can help you move your implementation forward, our first recommendation is to [connect with the community]({{ site.root_url | absolute_url }}/community/). The IIIF community is available to help point you in the right direction for your particular context and use cases.

The [iiif-discuss list](https://groups.google.com/forum/#!forum/iiif-discuss) can be used to search for past answers and to ask new questions. The community also has a [Slack team](http://bit.ly/iiif-slack) with many channels for asking questions. There may already be a [community group]({{ site.root_url | absolute_url }}/community/groups/) that is interested in the same domain as you.

The community also maintains the [Awesome IIIF](https://github.com/IIIF/awesome-iiif) list with links to software and resources.


## Information gathering

IIIF often requires pulling together people in different roles and data from different systems. We have created a [questionnaire]({{ site.root_url | absolute_url }}/assets/acc_implementation_questionnaire_011017.pdf) that can help you gather the kind of information needed to implement IIIF and self-assess.

Consider reaching out to the vendors of your current systems. They may already have a IIIF implementation as part of a recent version of their product, have an implementation in progress, or be considering developing one. Updating a product you already use may be easier than trying to implement new applications or developing something from scratch. There's a partial list of repository and DAMs software vendors included in the [Awesome IIIF](https://github.com/IIIF/awesome-iiif) list.

You may also want to gain a greater familiarity with all of the terminology around IIIF. You can go through a [self-guided IIIF workshop]({{ site.root_url | absolute_url }}/get-started/training/) to gain a better understanding. Take a look at an [implementation guide]({{ site.root_url | absolute_url }}/assets/acc_implementation_guide_011017.pdf) based on experience consulting with institutions on their own possible routes to implementation.


## Core APIs

The work of implementing the IIIF APIs can be broken down into the core APIs ([Image]({{ site.api_url | absolute_url }}/image) and [Presentation]({{ site.api_url | absolute_url }}/presentation/)) and additional APIs ([Authentication]({{ site.api_url | absolute_url }}/auth/), [Content Search]({{ site.api_url | absolute_url }}/search/), and [Change Discovery]({{ site.api_url | absolute_url }}/discovery/) ). 

The recommendation is to implement the core APIs first, and then the others can be added later depending on your needs. Note that it is possible to iteratively improve your image and presentation implementations over time. You can get started with the Image and Presentation APIs at a simpler level and then return to add more features.


### Image API

The [Image API]({{ site.api_url | absolute_url }}/image) allows for interoperable delivery of digital images. Simply, the API allows for constructing parameterized URIs for getting a particular region and/or size of an image. This ability to get regions and sizes of the image is what supports delivering thumbnails as well as deep zoom viewing. The image API also specifies a way to get information (info.json) about the image and what image derivatives and image manipulation features are supported for that image. What you need to implement is the server-side piece; later in this guide you can read about viewers for browsers. (We have [guide on working with viewers]({{ site.guides_url | absolute_url }}/using_iiif_resources/) as well.)

The image API can be implemented with only a standard web server (e.g. Apache or Nginx) or with a purpose built application called an image server. These different ways of implementing the API map to the different [compliance levels]({{ site.api_url | absolute_url }}/image/3.0/compliance/) for the API.

Implementing the Image API with only a web server would be a level 0 implementation. Through creating lots of static image sizes and tiles a level 0 implementation is simple and can still power deep zoom viewers.

The other option is to implement a IIIF image server (level 1 or 2). There are [many options for image servers](https://github.com/IIIF/awesome-iiif#image-servers) developed by the community. If you are just learning about image servers and would like to give one a try, our recommendation is to begin with [Cantaloupe](https://cantaloupe-project.github.io/) which is easy to get running, includes lots of features, and has a GUI interface for configuration. If you already have an image server that isn’t compliant with IIIF, then you may be able to use a [shim](https://github.com/IIIF/awesome-iiif#image-server-shims) to support IIIF. Vendors implementing the Image API should aim for a compliance level of at least level 1.

### Presentation API

While the Image API will allow you to deliver and share images, the Image API alone does not carry any descriptive metadata with it. In order to share your resources and have descriptive metadata travel with the image you will want to implement the [Presentation API]({{ site.api_url | absolute_url }}/presentation/). If you have a group of images that together form a single resource, you’ll use the Presentation API to sequence those images. Likewise, the Presentation API now includes affordances for working with audio and video materials as well.

What you create when you implement the Presentation API is a JSON document called a presentation manifest. It includes any information needed to present the whole resource to the user. Manifests can either be statically or dynamically created. The presentation API gets its name from the decision to focus on presentation of information to a user rather than on trying to agree on a new semantic metadata standard, so as you read documentation and look at examples keep this intentional decision to focus on presentation in mind.

The data you’ll need to create a presentation manifest for each resource may come from various systems within your environment. One element will be information about your Image API service. As there are so many different kinds of systems across so many different institutions there is no one way to implement other parts of presentation manifests. It often takes custom development to integrate data from different systems. 

There are some [presentation API libraries](https://github.com/IIIF/awesome-iiif#presentation-api-libraries) which might help with creating and validating your manifests. Again, check to see if any vended products you use support IIIF, as that may be the quickest path. Consider asking the IIIF community if anyone else is using the same or similar set of applications and how they were able to implement presentation manifests.

Manifests are highly nested JSON documents and can seem complicated, but once you learn the terminology you can learn to easily read manifests. Go through the IIIF workshop to [learn how to create a simple manifest](https://training.iiif.io/iiif-online-workshop/day-three/bodleian-editor/) and you’ll be on your way to understanding the main parts of manifests.

Once you have a basic manifest working in a presentation viewer, you can come back later and implement other presentation features like [linking properties]({{ site.api_url | absolute_url }}/presentation/3.0/#33-linking-properties). These include ways to link out to semantic descriptive metadata and renderings like PDFs. You can start with just some metadata and expand as you’re able to integration your various systems. These are also all the basics you need to be able to work with A/V materials -- easier in some sense because they don't rely on any Image API functionality, and require only references to streaming assets included in a IIIF manifest.

#### Community Cookbook

At this point, the [Cookbook of IIIF Recipes][annex-cookbook] may be an invaluable tool for you to see the best practices for manifest generation from the community.

The Cookbook gathers together examples of how to create IIIF Presentation API assets, in order to:

* Provide many more examples than the specification alone can do, for reference and learning;
* Encourage publishers to adopt common patterns in modeling classes of complex objects;
* Enable client software developers to support these patterns, for consistency of user experience (when desirable); and
* Demonstrate the applicability of IIIF to a broad range of use cases.

The [Cookbook][annex-cookbook] webpages are under constant development and the list of recipes include links to completed recipes and place holders for future recipes. The community welcomes additions to the [Cookbook][annex-cookbook]. To get started, review the [Cookbook process][recipe-process] and say hello on the Cookbook [Slack](http://bit.ly/iiif-slack) channel.

### Viewers and site integration

One choice you’ll need to make is what viewer you want to use for your IIIF resources on your own site. The choice breaks down into viewers that support only the Image API with deep zoom (at any compliance level) and viewers that support the Presentation API for displaying metadata and more than one image. When [looking for a viewer](https://github.com/IIIF/awesome-iiif#image-viewers) to use consider whether it is an image viewer or a presentation manifest viewer.

Viewers made to deep zoom an image include [OpenSeadragon](https://openseadragon.github.io/examples/tilesource-iiif/) and [Leaflet-IIIF](https://github.com/mejackreed/Leaflet-IIIF). Only the Image API needs to be implemented for a viewer of this kind to work. This kind of viewer is limited as it can only be used to view an image and cannot display metadata about your resources. This may be all that you need for your own site, though.

To present a manifest consider viewers like [Mirador](http://projectmirador.org/) or [Universal Viewer](http://universalviewer.io/). These viewers work with both the Image and Presentation APIs to provide a rich viewing experience. They can show metadata for the resource as a whole as well as have labels for individual page images and other features like download options. These rich client viewers can also be embedded on other sites. Mirador additionally allows for viewing and creating annotations on top of images in a manifest.

Whichever kind of viewer you implement for your own site you’ll want to implement presentation manifests (Presentation API) that work in presentation manifest viewers. Making presentation manifests available is what allows for enhanced sharing of your resources. With presentation manifests your users can make their own choice of viewers and tools. They may have their own instance of an application like Mirador set up to allow them to save their annotations. Giving users this kind of choice in viewing experience is an important aspect of the power of IIIF.

Here again, the [Cookbook of IIIF Recipes][annex-cookbook] may be an invaluable tool for replicating manifest best practices from within the community.

To allow users to view your resources in another viewer you may also want to advertise that the resource has a presentation manifest available. You could link out from a resource page on your site to different viewers you host as well as include a special drag & drop link allowing a user to select their own tool. This kind of functionality is offically being explored as part of the [IIIF Content State API specification]({{ site.api_url | absolute_url }}/content-state/) which described "how we point at things in IIIF" including not just manifests, but annotations on those manifests as well. (See also ["What is IIIF Content State?""](https://tom-crane.medium.com/what-is-iiif-content-state-dd15a543939f))


### Additional APIs

There are some additional IIIF APIs you may want to consider implementing once you have implemented the core APIs.

The **[Authentication API]({{ site.api_url | absolute_url }}/auth/)** helps to manage a workflow for granting authenticated access for IIIF resources while allowing a user to still use the viewer of their choice. If you need to restrict access to your resources or provide degraded versions of your resources in some cases take a look at this API.

The **[Content Search API]({{ site.api_url | absolute_url }}/search/)** allows for searching within a resource. (Note that it does not help to find the resource in the first place, but only helps to search within a resource once a user has discovered it.) Consider implementing the search inside API if you have full text for multi-page resources. The full text could either be from transcription or OCR. Rich client-side viewers like Universal Viewer and Mirador support the content search API.

The **[Change Discovery API]({{ site.api_url | absolute_url }}/discovery/)**
 leverages existing techniques, specifications, and tools in order to promote widespread adoption of an easy-to-implement service for describing changes to IIIF content resources and the location of those resources to harvest. Content providers can implement this API to enable the collaborative development of global or thematic search engines and portal applications that ultimately allow users to easily find and engage with content available via existing IIIF APIs.


## Other considerations

The goal of IIIF is to be interoperable allowing sharing and user choice. To enable this sharing and make your image resources available to web applications hosted on other domains, you will also need to consider some technical details. Since most of the image viewers use JavaScript, your image server will need to support [cross-origin resource sharing (CORS)](http://enable-cors.org/). 

Additionally most browsers require the use of HTTPS, and in order for your images and presentation manifest to be requested without [mixed content](https://developer.mozilla.org/en-US/docs/Web/Security/Mixed_content) issues they should also be delivered with HTTPS.

## Further exploration

We hope this guide has been useful in walking you through initial questions to answer and aspects of IIIF to explore. We encourage you to take a look at the many ways to get [involved with the IIIF Community]({{ site.root_url | absolute_url }}/get-involved/) which can be the quickest and best way to get questions aswered and see cutting edge implementations for inspiration. Likewise, take a look at our other [resources for developers and implementers]({{ site.root_url | absolute_url }}/get-started/#implementers). And of course, if you come across something useful and want to see it represented here or elsewhere on our site, please [get in touch with us]({{ site.root_url | absolute_url }}/community/consortium/staff)!


_<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />The original version of this work by Jason Ronallo is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>. Funded by the [IIIF Consortium]({{ site.root_url | absolute_url }}/community/consortium/) and the [American Art Collaborative](http://americanartcollaborative.org/)._


[annex-cookbook]: {{ site.cookbook_url | absolute_url }}
[recipe-process]: {{  site.cookbook_url | absolute_url }}/recipe/ "Cookbook process"