# brightin-template

This repository contains configuration files and installation instructions for
including common linting and analysis tools in projects. Copy these into your
projects and use pull requests to propose changes to defaults.

Do you disagree with anything in this repo? Want to discuss something? Open an
issue or submit a pull request!

## Purpose

Static analysis to catch common errors and enforce consistentcy can both make
your more productive and improve shared ownership of your codebase. This
repository contains instructions on how to add various tools to your projects
and hit the ground running with sensible (but opinionatd) default
configurations.

For maximum benefit, set up a continuous integration workflow that automatically
tests your code using these tools, and whatever else you can automate.

## Table of contents

* Ruby
    - Rubocop
    - Reek
    - Brakeman
    - bundler-audit
    - SimpleCov
    - Rollbar
* JavaScript
    - eslint
* CoffeeScript
    - coffeelint
* Git
    - pre-commit hooks

See the top-level directories in this repository for more information.

## Installation

You can copy files to your own liking, or use the generator script provided to
copy relevant files to your project directory. Clone this repo and run the
generator to see available options:

    /path/to/brightin-template/brightin-template -h

## Wish list

* Jslint
* Jshint
* Rails best practices
* Ruby-lint

## Credits

These configurations, scripts and conventions are extracted from real-world
usage at [Brightin][].

[Brightin]: http://brightin.nl
