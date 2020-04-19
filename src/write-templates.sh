#!/usr/bin/env bash
set -o errexit -o pipefail -o nounset

write_templates () {
  echo "${this_dir}::${package_root}"
  
  # Write all project templates
  cp "${this_dir}/templates/index.js" "${package_root}/"
  cp "${this_dir}/templates/index.test.js" "${package_root}/tests/"
  cp "${this_dir}/templates/rollup.config.js" "${package_root}/"
  cp "${this_dir}/templates/.prettierrc" "${package_root}/.prettierrc"
  cp "${this_dir}/templates/.npmignore" "${package_root}/"
  cp "${this_dir}/templates/.npmrc" "${package_root}/"

  # package.json
  cat > "${package_root}/package.json"<<EOF
  {
    "name": "@codewell/${package_name}",
    "version": "0.0.1",
    "main": "index.js",
    "scripts": {
      "test": "jest",
      "build": "rollup --config",
      "release": "npm run build:dev && npm run build:prod",
      "build:prod": "NODE_ENV=production rollup -c",
      "build:dev": "NODE_ENV=development rollup -c",
      "dry-release": "npm run release && npm pack"
    },
    "husky": {
      "hooks": {
        "pre-commit": "lint-staged"
      }
    },
    "lint-staged": {
      "*.js": "prettier --write"
    }
  }
EOF

  # .gitignore
  cat >> "${package_root}/.gitignore"<<EOF
  # Mac specific
  .DS_Store

  # Secret stuff
  .npmrc
  .env

  # Node package
  node_modules
  *.tgz
EOF

  codewell_package="@codewell/${package_name}"

  # README
  cat >> "${package_root}/README.md"<<EOF
  # ${codewell_package}

  ## Installation
  \`\`\`
  npm install ${codewell_package}
  \`\`\`

  ## Basic Usage
  \`\`\`JavaScript
  import /* FIXME: <nameOfModule> */ from '${codewell_package}';

  //FIXME: Write examples here
  \`\`\`


  ## Contribution
  Please help by submitting issues and pull requests here on github
  Read more on [codewell's webpage](https://codewell.github.io/contribution)
EOF
}
