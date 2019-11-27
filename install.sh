#!/bin/bash

# Install new package cli tool

# Create the .npmrc if it does not exist
touch ./src/templates/.npmrc

ln -s $(pwd)/src/main.sh ~/bin/npkg

# Make a link for testing
ln -s $(pwd)/src/main.sh $(pwd)/npkg-test

chmod +x ~/bin/npkg
