#!/user/bin/env bash

create_boilerplate () {
  # Create package folder
  mkdir "${package_root}/src"
  mkdir "${package_root}/tests"
  mkdir "${package_root}/lib"

  # Create boilerplate files
  touch "${package_root}/src/index.js"

  # Create readme if it does not exist
  touch "${package_root}/README.md"
}

