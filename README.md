# `{easystats}`-workflows

GitHub Actions for `{easystats}` packages. 

To know more about how to build automation infrastructure to improve user experience and development workflow of R packages using these workflows, have a look at these slides:

<https://indrajeetpatil.github.io/preventive-r-package-care>

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

## List of workflows

Workflow | Purpose
---|---
R-CMD-check-devel-easystats.yaml | Run R CMD check with the development version of all `easystats` packages
R-CMD-check-hard.yaml | Run R CMD check with hard dependencies only (`Imports`)
R-CMD-check-strict.yaml | Run R CMD check and fails if there are any `WARNING`s or `NOTE`s 
R-CMD-check.yaml | Run standard R CMD check
check-all-examples.yaml | Run `devtools::run_examples()` on all examples, even those in `\dontrun{}`. Fails if there are any warnings.
check-link-rot.yaml | Checks that there are no outdated links (uses `urlchecker`).
check-random-test-order.yaml | Randomize the order in which tests are run. This is to detect whether some tests change the global environment or if they are self-contained.
check-readme.yaml | Check that the README can be properly rendered.
check-spelling.yaml | Checks spelling, uses `spelling`.
check-styling.yaml | Checks styling, uses `styler`.
check-test-warnings.yaml | Similar to `R-CMD-check-hard.yaml` but only runs tests, not R CMD check.
check-vignette-warnings.yaml | Fails if there are warnings in vignettes.
html-5-check.yaml | ??
lint-changed-files.yaml | Runs `lintr` on the files that were modified.
lint.yaml | Runs `lintr` on the whole package.
pkgdown-no-suggests.yaml | Checks that `pkgdown` works with hard dependencies only.
pkgdown.yaml | Runs the `pkgdown` workflow.
pre-commit.yaml | ??
revdepcheck.yaml | Checks reverse dependencies, it is only run when the branch name starts with `"rc"`.
test-coverage-examples.yaml | Checks how much examples cover the package functions and arguments.
test-coverage.yaml | Checks how much tests cover the package functions and arguments.
update-to-latest-easystats.yaml | Creates a PR to bump all `easystats` dependencies to their latest CRAN version.

# Acknowledgments

These workflows are based on [r-lib/actions](https://github.com/r-lib/actions). Huge thanks to the creators, maintainers, and contributors to that repo!!

## License ![CC0 licensed](https://img.shields.io/github/license/r-lib/actions)

All examples in this repository are published with the [CC0](./LICENSE) license.
