#!/bin/bash 

bundle config path vendor/bundle
if [ $? -eq 1 ];then
    echo "Failed adding config path"
    exit 1
fi

bundle install
if [ $? -eq 1 ];then
    echo "Failed bundle install"
    exit 1
fi

echo "Running config: $CONFIG"
if [ -z ${BASE_URL} ]; then
    BASE_CONFIG=""
else
    BASE_CONFIG="--baseurl $BASE_URL"
fi
bundle exec jekyll build $BASE_CONFIG $CONFIG
if [ $? -eq 1 ];then
    echo "Failed jekyll build"
    exit 1
fi

