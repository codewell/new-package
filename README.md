# new-package

Command Line Interface for npm package boilerplating

## Installation

1. Get compy of the code. E.g. clone or download.
2. Run

```bash
./install
```

_You can put a copy of your npm auth token in the `.npmrc` file in the `templates` folder. It will be ignored by git._

### Additional config

- `package.json` - Some fields in `package.json`, e.g. `license` and `name` needs to be updated to have the correct value for your package.
- `.npmrc` - Your nodejs auth key needs to be added to [`.npmrc`](https://docs.npmjs.com/files/npmrc).
- PATH - You might need to export your `PATH` in your `.bash_profile`

## Basic usage

```
npkg <git-repo-clone-url>
```

Creates an npm package boilerplate in the current directory with the same name as the repository.
