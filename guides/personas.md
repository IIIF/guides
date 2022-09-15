---
title: Guide to IIIF personas
id: personas
layout: spec
breadcrumbs:
 - label: Get started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: '/'
subtitle: How to understand your users through IIIF personas
---



This guide is intended for use by managers, product owners, team leaders, and other decision makers. It can be referenced by individuals who are responsible for incorporating IIIF standards into their digital platforms or for enhancing the usability and user experience of existing IIIF implementations. 

The user research that informed this guide was presented at IIIF Annual 2021 (virtual). For more context, you can view the [presentation slides](https://docs.google.com/presentation/d/1JhhjJdGIAZjYm0j9iNig7-YT2LJqFgVgThsoS59jAV0/edit?usp=sharing) and watch the [recorded 45 minute keynote](https://www.youtube.com/watch?v=87JPwx780VI). See the methodology section at the end for more details including background and participants.

<iframe style="width: 60%; height: 28em; margin: 0 auto;" src="https://www.youtube-nocookie.com/embed/87JPwx780VI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


## What are personas?

The purpose of personas is to inform the development process through user-centered design practices.


Personas: 

* Are artifacts of user research
* Represent archetypes of users
* Demonstrate an amalgamation of many user needs
* Represent different user groups that have diverse needs, purposes, and goals
* Can be used to inform decisions, such as: “Who is this feature for?”
* Are built on research that discovers how target audiences use different systems, websites, services, etc.

Users may be represented by more than one persona: they may perform different roles at different times, or their goals and tasks might change over time. 

## IIIF personas

These personas were generated from a user research study that interviewed “digital image researchers” within the IIIF community or one degree removed, such as those who work at or with a IIIF community member institution.The personas describe users and their behavior specifically in relation to IIIF. The study authors believe that Gatherers are the most common persona, followed in decreasing order by Educators, Adopters, and finally Builders.

### Builders

Builders are technical users such as developers, software engineers, and programmers. They have technical knowledge of the IIIF API specifications and are involved in building IIIF-enabled digital platforms. However, they are not typically **_users_** of IIIF-enabled resources like our other personas. Therefore, builders can often benefit from awareness of the other persona types.

|-----|------|
|**Expertise in IIIF**|Possess a deep, technical knowledge|
|**Motivation** |Make digital content from their institution available|
|**Tools**|Use tools like Github, code editors, open source tools|
|**Community Involvement**|Members of the IIIF community|

Implementation questions to consider:

* How can builders incorporate an awareness of IIIF users’ needs into the development process?

### Educators

Educators are non-technical users such as faculty, librarians, and instructors. They are aware that IIIF exists, and their roles involve incorporating IIIF-enabled resources and tools into teaching, assignments, curricula, and training. As non-technical users, they need tools that have documentation and do not require coding skills.

|-----|------|
|**Expertise in IIIF**|Understand how to use IIIF tools for viewing, annotation, and transcription|
|**Motivation** |Teach people about the possibilities of IIIF|
|**Tools**|Use tools like viewers in teaching|
|**Community Involvement**|May be involved with IIIF community|

Implementation questions to consider:

* How can the interface incorporate IIIF in ways that enable non-technical users?
* How can the interface make teaching and disseminating IIIF-related skills and techniques easier?

### Adopters

Adopters vary in their technical knowledge. They may be researchers, students, museum professionals, or digital humanists. They might not know exactly what IIIF is or how it works. They utilize and specifically seek out IIIF-enabled resources to access images, create annotations and transcriptions, and design exhibits. Even though they are generally more advanced users than Educators, they still describe the IIIF experience as a challenging one that requires a steep learning curve.

|-----|------|
|**Expertise in IIIF**|Utilize IIIF-compliant materials for research projects|
|**Motivation** |Available technology and materials relevant to their research|
|**Tools**|Use tools like FromThePage, Wordpress, Omeka, and other out-of-the-box solutions for research projects|
|**Community Involvement**|Involved in their own research communities more than IIIF community|


Implementation questions to consider:

* How can advanced use cases such as collecting and annotating be provided?
* How can interfaces make IIIF-enabled resources easy to find and use even when Adopters don’t fully understand it?

### Gatherers

Gatherers engage with digital images but are generally not aware of IIIF. Their work can be accomplished with or without specific IIIF knowledge or resources. They don’t seek to understand the technology behind the tools that make their research possible. They may be served equally well by IIIF-enabled and non-IIIF-enabled resources as long as the resources they need are available online. 


|-----|------|
|**Expertise in IIIF**|Does not use IIIF. May be aware or unaware that it exists|
|**Motivation** |The materials relevant to their research; technology agnostic|
|**Tools**|Use tools like Zotero, Google Drive, Dropbox and MS Office to manage digital items|
|**Community Involvement**|Involved in their own research communities|

Implementation questions to consider:

* How will the interface allow users to conduct their work without any knowledge of IIIF?

## Research Insights

These insights were generated from our user interviews before they were integrated into personas. Since IIIF materials are most often displayed and consumed via viewers such as Mirador and UniversalViewer, there is significant overlap between “the IIIF experience” and “the viewer experience.”

These insights summarize patterns that were discovered across all interview participants.

1. Most users are unable to clearly articulate what IIIF is.
2. IIIF users aren’t developers - many expressed a desire for documentation and training that doesn’t require coding skills.
3. Introduction to IIIF usually occurs through direct training or when its use is promoted by advocates. Introductions are more relevant to potential users when examples and presentations relate to users’ own research.
4. Users who are familiar with IIIF express that it was a challenging learning process, even when training and specific examples were provided.
5. Most users only use viewers for basic tasks, like viewing and zooming while doing research; they don’t often use features like comparison and rotation.
6. IIIF is most closely aligned to the requirements for presentation, exhibits, teaching, and reference.
7. IIIF does not replace the desire to store a digital copy of the object. 
8. IIIF-compatible materials are not a primary source for most scholars and researchers. 
9. When UI tools like FromThePage are available, IIIF is easier to use. \


## Methodology

### Background

These personas were developed as part of a user research study that asked participants - members of IIIF’s target audiences - to walk through their daily tasks related to online digital image research. It was conducted in early 2021 as part of the Design (formerly [Discovery for Humans](https://iiif.io/community/groups/D4H/) or D4H) community group’s efforts to understand more about our audiences. 

Research team: 

* Amy Deschenes (Harvard University)
* Ben Bakelaar (St. Louis University)
* Richard Higgins (Durham University)
* Jeff Mixter (OCLC)
* Stacey Redick (Folger Shakespeare Library)

### Research questions

1. Do researchers who are familiar with IIIF engage with materials differently from those that are not familiar with IIIF?
2. How do users learn how to use IIIF / what you can do with IIIF?
3. For researchers who understand the benefits of IIIF, when do they choose to use it or not use it? 
4. What features do they use or would they use (IIIF enabled or other?) when working with images for academic research? 
5. Do researchers find engaging with IIIF-compliant materials to be a value add to their research (i.e., do they or would they engage with a IIIF manifest rather than simply download an image?)

### Methodology

* Interviews & observations with 25+ people who use digital materials in their work. This group includes IIIF power users and people unfamiliar with IIIF
* Survey of 25+ other people familiar with IIIF

### About the Participants

50 Participants

* Researchers, fellows, scholars, faculty members, librarians, and curators
* Participants from France, Italy, Japan, U.K., and the U.S