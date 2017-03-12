#!/bin/bash

# to update all plugins we git pull for each repo

pushd ./bundle

for dir in `ls -Ad */`; do
    pushd "./${dir}"
    git pull --depth 1
    popd
done
