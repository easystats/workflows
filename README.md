# `{easystats}`-workflows

GitHub Actions for `{easystats}` packages. 

# Using in your packages

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

These workflows are based on [r-lib/actions](https://github.com/r-lib/actions). Huge thanks to the creators and maintainers!!
