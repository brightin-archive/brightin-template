# Brightin styleguide

## Coffeelint

[Coffeelint][coffeelint] is a jshint-alternative for linting your coffee script
files and catching common style errors.

### Installation

Make sure you have coffeelint installed on your system. It is distributed as an
NPM package:

    npm install -g coffeelint

### Usage

You can run coffeelint directly from the command line:

    coffeelint --file .coffeelint.json

Alternatively, you can define a Rake task in your Rails project to do the same
thing. You can use `coffeelint.rake` as a template. This is helpful when you
define a single Rake task to run on a continuous integration server and want to
add coffeelint to this workflow:

    # lib/tasks/ci.rake
    task ci: %i(spec cucumber coffeelint)

### Configuration

You can create a configuration file in the root of your directory to hold your
configuration. You can use this repository's `.coffeelint.json` as a template.
