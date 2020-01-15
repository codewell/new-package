#!/usr/bin/env bash


# Takes a github url e.g.
# git@github.com:codewell/new-package.git
# and "returns" the name of the repo
# "new-package"
get_repo_name () {
  # Get the slug of the url "foo.git"
  directory=${repo_url##*/}

  # Trim the .git part
  repo_name=${directory%.*}
  echo "${repo_name}"
}