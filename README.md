# scala-cross-versions

A GitHub Actions to extract sbt's "crossScalaVersions" for matrix in other action.

## Example

```yaml
name: CI
on:
  pull_request:
jobs:
  get_scala_versions:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: exoego/cross-scala-versions@master
        id: run
    outputs:
      scala_versions: ${{ steps.run.outputs.scala_versions }}

  build:
    needs: get_scala_versions
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        scala: ${{ fromJson(needs.get_scala_versions.outputs.scala_versions) }}
    steps:
      - uses: actions/checkout@v2
      - run: sbt ++${{ matrix.scala }} test
```
