source 'https://rubygems.org'

gem 'jekyll', '~> 4.1.1'

# for local development, clone theme + use path loader
# gem 'iiifc-theme', path: 'iiifc-theme'
gem 'iiifc-theme', github: 'mnyrop/iiifc-theme', branch: 'main'

group :jekyll_plugins do
    gem "jekyll-last-modified-at"
end

group :development, :test do
  gem 'html-proofer'
  gem 'rspec'
  gem 'rake'
end

# For open graph and Twitter Card elements
gem 'jekyll-seo-tag'
