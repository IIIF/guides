---
title: Contributing to IIIF Guides
---
<a href="index.html">Back to Index</a><br/><br/>
We welcome pull requests to the IIIF Guides repository but please read the following guidance. 

## Summary
All pull requests submitted to this repo will need to be checked using the IIIF preview infrastructure which is generated for pull requests. This means the branch you are working on will need to be in the IIIF repo. To allow you to create a branch in the IIIF repo you will need to be in the [guides](https://github.com/orgs/IIIF/teams/guides) GitHub Team. To do this contact one of the members of IIIF staff who can add you.

The stages to add a submission are as follows:

 1. Apply to join the [guides](https://github.com/orgs/IIIF/teams/guides) GitHub team by contacting one of the IIIF staff members
 2. Clone the Guides repository to your machine [https://github.com/IIIF/guides](https://github.com/IIIF/guides)
 3. Create a new branch for your changes from the main branch.
 4. Create a new directory for your guide. Name the directory to match the domain name of the institution e.g. st-andrews.ac.uk
 5. Copy the [template.md](https://github.com/IIIF/guides/blob/main/guides/template.md) to your new directory and call it `index.md`
 6. Upload any screen shots to your new directory
 7. Edit the `index.md` file to link the screen shots. Note this can be done in Markdown using the following:

```
![alternate text for the image](path_to_image.png)

e.g:

![Copy the IIIF manifest from the button in the catalogue](catalogue.png)
```

 8. Add and commit your changes to your local branch
 9. Create a new pull request with your changes
 10. This will be reviewed and then merged by a member of the [Guide Admin group](https://github.com/orgs/IIIF/teams/guide-admin)

## Full instructions

The steps above can all be achieved by using the GitHub web interface without installing any software. There is a step by step guide below to take you through this process. 

