#!/bin/sh
set -e

brew install nodebrew

nodebrew -v


echo 'export NODEBREW_ROOT=/usr/local/var/nodebrew' >> ~/.zprofile
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zprofile

source ~/.zprofile

mkdir -p ~/.nodebrew/src

nodebrew install-binary v10.16.3

nodebrew use v10.16.3

brew install yarn --ignore-dependencies