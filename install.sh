#!/bin/bash

# Install new package cli tool

# Create the .npmrc if it does not exist
touch ./src/templates/.npmrc

ln -s $(pwd)/src/main.sh ~/bin/npkg

chmod +x ~/bin/npkg
