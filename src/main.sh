#!/usr/bin/env bash
set -o errexit -o pipefail -o nounset

# The first argument to the cli
# should be a github repo url
repo_url="${1}"

# Get the name of this directory
this_dir=$(dirname "${BASH_SOURCE[0]}")

##
# Import all lib scripts
#
source "${this_dir}/get-repo-name.sh"

package_name=$(get_repo_name "${repo_url}")
package_root="$(pwd)/${package_name}"

source "${this_dir}/create-boilerplate.sh"
source "${this_dir}/write-templates.sh"
source "${this_dir}/install-dependencies.sh"


main () {
  git clone "${repo_url}"
  create_boilerplate
  write_templates
  install_dependencies
}

main
