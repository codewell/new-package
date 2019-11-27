#!/bin/bash

# Get path to this library source
this_path=$(dirname ${BASH_SOURCE[0]})
echo $this_path
lib_path=$(readlink ${this_path})
echo $lib_path

# Get path the script is called from
call_folder=$(pwd)

# Get the repo url and clone it
repo=$1
git clone $repo

# Get the name of the repo
directory=${repo##*/}
package_name=${directory%.*}

# The path to the root of the package folder
root_path=$call_folder/$package_name

# Cretate package boilerplate
bash $lib_path/create-boilerplate.sh $root_path

# Write template files
bash $lib_path/write-templates.sh $root_path $package_name

# Install dev dependencies
bash $lib_path/install-dependencies.sh $root_path
