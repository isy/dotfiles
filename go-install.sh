#!/bin/sh
set -e

brew install go

echo 'export GOPATH=$HOME/go' >> ~/.zprofile
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zprofile

source ~/.zprofile