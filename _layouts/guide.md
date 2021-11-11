---
layout: page

hero:
    image: "https://ids.si.edu/ids/iiif/CHSDM-139887_01/full/1024,/0/default.jpg"

breadcrumbs:
 - label: Get Started
   link: '{{ site.root_url }}/get-started'
 - label: Guides
   link: index.html
---
<article class="post h-entry" itemscope itemtype="http://schema.org/BlogPosting">

  <header class="post-header">
   <!-- <h1 class="post-title p-name" itemprop="name headline">{{ page.title | escape }}</h1>-->
    <p class="post-meta">Last update: 
      {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
      <time class="dt-published" datetime="{{ page.date | date_to_xmlschema }}" itemprop="datePublished">
        {{ page.date | date: date_format }}
      </time>
        <time class="dt-modified" datetime="{{ mdate }}" itemprop="dateModified">
          {{ page.last_modified_at | date: "%-d %B %Y" }}
        </time>
      {%- if page.author -%}
        • {% for author in page.author %}
          <span itemprop="author" itemscope itemtype="http://schema.org/Person">
            <span class="p-author h-card" itemprop="name">{{ author }}</span></span>
            {%- if forloop.last == false %}, {% endif -%}
        {% endfor %}
      {%- endif -%}
      </p>
    <h3><a href="{{page.homepage}}">{{page.homepage}}</a></h3>
  </header>

  <div class="post-content e-content" itemprop="articleBody">
    {{ content }}
  </div>

  {%- if page.direct -%}
  <div style="padding-top: 5px; padding-bottom: 10px;">
    <p>Direct link to item:</p>

    <a href="{{page.direct}}">{{page.direct}}</a>
  </div>
  {%- endif -%}

  {%- if site.disqus.shortname -%}
    {%- include disqus_comments.html -%}
  {%- endif -%}

   
  <a class="u-url" href="{{ page.url | relative_url }}" hidden></a>
  <a href="../../index.html">Back to Index</a><br/><br/>
</article>

