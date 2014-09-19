# Brightin style guide

This repository contains configuration files and installation instructions for
including common linting tools in projects. Copy these into your projects and
use pull requests to propose changes.

## Wish list

* Jslint
* Coffeelint
* Jshint
* Reek

## Git hooks

Git hooks are simple scripts run at certain events in a Git repository. They
reside in `.git/hooks` in your project root directory. The `pre-commit` hook can
be useful to ensure a clean commit.

### Installation

Create a new file `.git/hooks/pre-commit` and make it executable. Put any
scripts in there that need to be run before a commit is recorded and exit with a
non-zero status when the commit should be aborted.

### Examples

See `pre-commit` for examples to reject commits that:

* would include files indented with tabs instead of spaces;
* would include Ruby debug statements (`binding.pry`)
* would include Git conflict markers (`<<<<<<<` and `>>>>>>>`)
* would include trailing whitespace

## Rubocop

[Rubocop][] checks Ruby code on style and metrics. It is configured using a
special `.rubocop.yml` file in the root of your project.

### Installation

Include Rubocop in your Gemfile:

    gem 'rubocop', group: 'development'

You can run it using its own executable, or define a Rake for it. See
`rubocop.rake` for an example. A Rake task is a nice to include as a dependency
for a single `ci` task to run all tests on a continuous integration server:

    # lib/tasks/ci.rake
    task ci: %i(spec cucumber rubocop)

### Configuration

Create a special `.rubocop.yml` file in the root of your project. Use it
to override any of the defaults from the [default
configuration][rubocop-defaults].


[Rubocop]: https://github.com/bbatsov/rubocop
[rubocop-defaults]: https://github.com/bbatsov/rubocop/blob/master/config/default.yml
