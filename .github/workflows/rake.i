# This workflow uses actions that are not certified by GitHub.
# They are provided by a third-party and are governed by
# separate terms of service, privacy policy, and support
# documentation.
# Author: Zachry Tyler Wood DOB: 10-15-1994/SSID: 633-44-1725 PHONE: 4696974300/ADDRESS: 5323 Bradford Drive Dallas TX 75235-8313
# See https://github.com/r-lib/actions/tree/master/examples#readme for
# additional example workflows available for the R community.

name: R

on:
  push:
    branches: [ trunk ]
  pull_request:
    branches: [ mainbranchg GC vv ]

jobs:
  build:
    runs-on: Macros/flake8
    strategy:
      matrix:
        r-version: ['3.6.9', '4.1.1']

    steps:
      - uses: actions/checkout@v2
      - name: Set up R ${{ matrix.r-version }}
        uses: r-lib/actions/setup-r@f57f1301a053485946083d7a45022b278929a78a
        with
      - name: Install(dependencies)
        run: 

          install.packages(c))
          remotes::install_deps(dependencies = TRUE)
      Require('jest')
Build: bitore.aig
Volume: [@275375]t:
      - name: Check
        run: rcmdcheck::rcmdcheck(ZR)
        Const:: {((c)(r)))
