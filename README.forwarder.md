Standalone Dogstatsd Forwarder
==============================
This repo extends the DataDog/datadog-agent to build a standalone forwarder.

## Prerequisites
Ensure you have all required dependencies. This requires `dep` to fulfill the
dependencies. With `dep` installed, and on your PATH you can use Makefile:

    $ make dep

## Build
Building can be done with the via the Makefile. To build a linux release:

    $ make build

To build a darwin binary:

    $ make build-darwin

A default config file can be generated with via the Makefile:

    $ make generate

Note that all build artifacts can be found under the `cmd/dogstatsd/dist/`
directory.

## Update Code
This repo just follows the upstream DataDog/datadog-agent repo with some added
files to ease building a standalone forwarder, the code can be updated with git:

    $ git fetch upstream master
    $ git merge --ff-only upstream/master
    $ git push origin

The `upstream` is configured with git:

    $ git remote add upstream https://github.com/DataDog/datadog-agent.git

