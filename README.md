# IIIF Guides
A guide to getting IIIF resources from the community

## Contributing

We welcome pull requests for corrections or new entries made on this repo. Please don't fork the repo and send pull request that way. Please see the [CONTRIBUTING.md](CONTRIBUTING.md) guide for full details on how to submit.

We also have a [Google form](https://forms.gle/S6LLjBy2o4iEBR8C9) which you can submit and the IIIF Staff will add your entry. 

## Front matter fields for guides

When adding a guide you can use the following front matter fields: 
```
title: National Library of X
# One of: no, full or associate
consortium: full
homepage: url_to_collection_website
layout: guide
visible: no
```

Note `visible` is optional and if not included will mean the guide will be shown in the index.

## Running locally

Run once to install the libraries:

``bundle install``

Run to start the site on [http://localhost:4000](http://localhost:4000):

```
bundle exec jekyll serve
```
