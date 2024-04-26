
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{easystats}`-workflows

GitHub Actions for `{easystats}` packages.

To know more about how to build automation infrastructure to improve
user experience and development workflow of R packages using these
workflows, have a look at these slides:

<https://indrajeetpatil.github.io/preventive-r-package-care/>

# Using workflows in your packages

## Reusing workflows

You don’t need to copy these workflows if you are happy as they are. In
this case, you can just reuse the workflow.

For example, if you wanted to use `check-spelling` workflow, your
workflow (in the file `.github/workflows/check-spelling.yaml`) would
look like so:

``` yaml
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

If you wish to copy any of these workflows in your own pages, you can do
so without asking for any permissions.

Just keep in mind that you will need to change the following lines:

``` yaml
on:
  workflow_call:
  
#name: test-coverage
```

to (e.g.)

``` yaml
on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]
    
name: test-coverage
```

## List of workflows

### General-purpose workflows

| Workflow                     | Purpose                                                                                                       |
|:-----------------------------|:--------------------------------------------------------------------------------------------------------------|
| R-CMD-check-hard.yaml        | Runs R CMD check with hard dependencies only (`Imports`)                                                      |
| R-CMD-check.yaml             | Runs standard R CMD check and fails if there are any `WARNING`s or `NOTE`s                                    |
| R-CMD-check-main.yaml        | Like above, but only runs on two systems. Can be used for main-branches, since full test-suite is run on PR.  |
| test-coverage-examples.yaml  | Checks code coverage via examples in the manual and vignettes                                                 |
| test-coverage.yaml           | Checks code coverage via tests                                                                                |
| check-random-test-order.yaml | Randomizes the order in which test files are run to check that tests are self-contained.                      |
| check-all-examples.yaml      | Runs *all* examples and checks that they execute successfully and without warnings                            |
| check-link-rot.yaml          | Checks that there are no outdated links (using `{urlchecker}`)                                                |
| check-readme.yaml            | Checks that the README can be properly rendered                                                               |
| check-spelling.yaml          | Checks for spelling mistakes (using `{spelling}`)                                                             |
| check-styling.yaml           | Checks code formatting against style guide (using `{styler}`)                                                 |
| check-test-warnings.yaml     | Checks for warnings in tests                                                                                  |
| check-vignette-warnings.yaml | Checks for warnings in vignettes                                                                              |
| lint.yaml                    | Runs `{lintr}` on the whole package to check for code quality issues                                          |
| lint-changed-files.yaml      | Runs `{lintr}` on the files that were modified in a PR to check for code quality issues                       |
| html-5-check.yaml            | Checks that manual pages are valid HTML5                                                                      |
| pkgdown.yaml                 | Runs the `{pkgdown}` workflow to check that the documentation website can be built                            |
| pkgdown-no-suggests.yaml     | Checks that `{pkgdown}` works with hard dependencies only                                                     |
| pre-commit.yaml              | Runs git hook scripts to check for code quality issues using [`precommit`](https://pre-commit.com/) framework |
| revdepcheck.yaml             | Checks reverse dependencies, it is only run when the branch name starts with `"rc"`                           |

### `easystats`-related workflows

| Workflow                         | Purpose                                                                         |
|:---------------------------------|:--------------------------------------------------------------------------------|
| R-CMD-check-devel-easystats.yaml | Runs R CMD check with the development version of all `easystats` packages       |
| update-to-latest-easystats.yaml  | Creates a PR to bump all `easystats` dependencies to their latest CRAN version. |

## Acknowledgments

These workflows are based on
[r-lib/actions](https://github.com/r-lib/actions). Huge thanks to the
creators, maintainers, and contributors to that repo!!

## License ![CC0 licensed](https://img.shields.io/github/license/r-lib/actions)

All examples in this repository are published with the [CC0](./LICENSE)
license.

## Other resources

Find more [CI/CD tools for
R](https://indrajeetpatil.github.io/awesome-r-pkgtools/#cicd) at
[awesome-r-pkgtools](https://github.com/IndrajeetPatil/awesome-r-pkgtools).
