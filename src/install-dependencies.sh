#!/bin/bash

root_path=${1}
cd $root_path

# Initialize npm
npm i -D  jest \
          @babel/preset-env \
          @babel/core \
          rollup \
          rollup-plugin-babel \
          rollup-plugin-node-resolve \
          rollup-plugin-commonjs \
          @rollup/plugin-replace \
          rollup-plugin-peer-deps-external \
