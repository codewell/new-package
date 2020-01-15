#!/usr/bin/env bash

write_templates () {
  echo "${this_dir}::${package_root}"
  # Write all project templates
  cp "${this_dir}/templates/index.js" "${package_root}/"
  cp "${this_dir}/templates/rollup.config.js" "${package_root}/"
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
      "*.js": [
        "prettier --write",
        "git add"
      ]
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
  import <nameOfModule> from '${codewell_package}';

  // Write examples here
  \`\`\`

  ## Testing
  **Functions**  
  Write tests in the \`tests/\` folder

  **Package**
  1. Make a dry reslease with \`npm run dry-release\`. This will generate a file \`packagename-x.x.x.tgz\`.
  2. Install the package in your other application/package by running \`npm install path/to/packagename-x.x.x.tgz\`.
  3. Import and use as usual in you application/package.

  ## Releasing
  1. Run \`npm run release\`
  2. Push the code to github
  3. Update package version 
      - \`npm version patch\` updates \`x.x.1\` -> \`x.x.2\`
      - \`npm version minor\` updates \`x.1.x\` -> \`x.2.x\`
      - \`npm version major\` updates \`1.x.x\` -> \`2.x.x\`
  4. Run \`npm publish --access public\`

  ## Contribution
  Please help by submitting issues and pull requests here on github
  Read more on [codewell's webpage](https://codewell.github.io/contribution)
EOF
}