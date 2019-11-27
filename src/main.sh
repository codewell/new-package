#!/bin/bash

# Get path to this library source
this_path=${BASH_SOURCE[0]}
lib_path=$(readlink ${this_path})
lib_dir=$(dirname $lib_path)


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
bash $lib_dir/create-boilerplate.sh $root_path

# Write template files
bash $lib_dir/write-templates.sh $root_path $lib_dir $package_name

# Install dev dependencies
bash $lib_dir/install-dependencies.sh $root_path
