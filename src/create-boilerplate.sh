#!/bin/bash

root_path=${1}

# Create package folder
mkdir $root_path/src
mkdir $root_path/tests
mkdir $root_path/lib

# Create boilerplate files
touch $root_path/src/index.js
touch $root_path/tests/index.test.js
touch $root_path/.npmrc

# Create readme if it does not exist
touch $root_path/README.md

