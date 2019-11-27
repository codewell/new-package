#!/bin/bash

# Get the latest version
git checkout master && git pull origin master

# Remove the symlink
rm ~/bin/npkg

# Reinstall the package
bash ./install.sh
