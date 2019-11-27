# new-package
CLI for npm package boilerplating

## Installation
```bash
bash install.sh
```
Will try to symlink this script to `~/bin/npkg`. And set permissions to execute the script.

*You can put a copy of your npm auth token in the `.npmrc` file in the `templates` folder. It will be ignored by git.*

### Additional config
* `package.json` - Some fields in `package.json`, e.g. `license` and `name` needs to be updated to have the correct value for your package. 
* `.npmrc` - Your nodejs auth key needs to be added to [`.npmrc`](https://docs.npmjs.com/files/npmrc).
* PATH - You might need to export your `PATH` in your `.bash_profile`

## Basic usage
```
npkg <git-repo-url>
```
Creates an npm package boilerplate in the current directory with the same name as the repository.
