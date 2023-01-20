# `{easystats}`-workflows

GitHub Actions for `{easystats}` packages. 

# Using workflows in your packages

## Reusing workflows

You don't need to copy these workflows if you are happy as they are. In this case,
you can just reuse the workflow. 

For example, if you wanted to use `check-spelling` workflow, your workflow 
(in the file `.github/workflows/check-spelling.yaml`) would look like so:


```yaml
on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]

name: check-spelling

jobs:
  check-spelling:
    uses: easystats/workflows/.github/workflows/check-spelling.yaml@main
```

## Copying workflows

If you wish to copy any of these workflows in your own pages, you can do so 
without asking for any permissions.

Just keep in mind that you will need to change the following lines:

```yaml
on:
  workflow_call:
  
#name: test-coverage
```

to (e.g.)

```yaml
on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]
    
name: test-coverage
```

# Acknowledgments

These workflows are based on [r-lib/actions](https://github.com/r-lib/actions). Huge thanks to the creators, maintainers, and contributors to that repo!!

## License ![CC0 licensed](https://img.shields.io/github/license/r-lib/actions)

All examples in this repository are published with the [CC0](./LICENSE) license.
