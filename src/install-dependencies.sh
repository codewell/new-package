#!/usr/bin/env bash

# The first argument to this script
# should be the path to the root folder
# of the new package

install_dependencies () {
  cd "${package_root}" || exit
  npm i -D jest \
    @babel/preset-env \
    @babel/core \
    rollup \
    rollup-plugin-babel \
    rollup-plugin-node-resolve \
    rollup-plugin-commonjs \
    @rollup/plugin-replace \
    rollup-plugin-peer-deps-external \
    prettier \
    husky \
    lint-staged
}
