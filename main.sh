#!/bin/bash

# Get path the script is called from
call_folder=$(pwd)
repo=$1

git clone $repo
directory=${repo##*/}
package_name=${directory%.*}

root_path=$call_folder/$package_name

# Create package folder
mkdir $root_path
mkdir $root_path/src
mkdir $root_path/tests

# Create index files
touch $root_path/src/index.js
touch $root_path/tests/index.test.js
touch $root_path/README.md

# Ignore files
cat > $root_path/.gitignore<<EOF
.DS_Store
.npmrc
.env
node_modules
EOF

cat > $root_path/.npmignore<<EOF
tests
EOF

# Auth
touch $root_path/.npmrc

cd $root_path

# Initialize npm
npm init -y
npm i -D jest
