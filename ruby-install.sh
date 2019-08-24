#!/bin/sh
set -e

brew install rbenv ruby-build

echo 'export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(rbenv init -)"' >> ~/.zprofile

source ~/.zprofile


rbenv install 2.6.3

rbenv global 2.6.3

rbenv rehash

ruby -v

gem install bundler

bundle -v