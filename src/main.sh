#!/usr/bin/env bash

# The first argument to the cli
# should be a github repo url
repo_url="${1}"

# Get path to this library source
# this_path="${BASH_SOURCE[0]}"

# Get the name of this directory
this_dir=$(dirname "${BASH_SOURCE[0]}")

# Get path the script is called from
# call_folder=$(pwd)


##
# Import all lib scripts
#
source "${this_dir}/get-repo-name.sh"
source "${this_dir}/create-boilerplate.sh"
source "${this_dir}/write-templates.sh"
source "${this_dir}/install-dependencies.sh"

package_name=$(get_repo_name "${repo_url}")
package_root="$(pwd)/${package_name}"

main () {
  git clone "${repo_url}"
  create_boilerplate
  write_templates
  install_dependencies
}

main