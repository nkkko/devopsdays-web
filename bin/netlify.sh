#!/bin/bash

echo "Install Dart Sass..."

# This is in Netlify's PATH.
BIN_DIR=/opt/build/repo/node_modules/.bin
DARTSASS_VERSION=1.71.1

mkdir -p $BIN_DIR

curl -LJO https://github.com/sass/dart-sass/releases/download/${DARTSASS_VERSION}/dart-sass-${DARTSASS_VERSION}-linux-x64.tar.gz
#curl -LJO https://github.com/sass/dart-sass/releases/download/1.71.1/dart-sass-1.71.1-linux-x64.tar.gz

tar -xvf dart-sass-${DARTSASS_VERSION}-linux-x64.tar.gz

mv dart-sass/sass $BIN_DIR

rm -rf dart-sass*

echo "List Bin Dir..."

ls $BIN_DIR;

sass --embedded --version

echo "Building..."

hugo version
hugo --theme=devopsdays-theme --buildDrafts=false --baseURL="$DEPLOY_PRIME_URL" --gc --minify
cp bin/staging-robots.txt public/robots.txt