# Brightin style guide

This repository contains configuration files and installation instructions for
including common linting tools in projects. Copy these into your projects and
use pull requests to propose changes.

## Wish list

* Jslint
* Jshint
* Reek
* Brakeman
* Rails best practices

## Git hooks

Git hooks are simple scripts run at certain events in a Git repository. They
reside in `.git/hooks` in your project root directory. The `pre-commit` hook can
be useful to ensure a clean commit.

### Installation

Create a new file `.git/hooks/pre-commit` and make it executable (`chmod +x
.git/hooks/pre-commit`). Put any scripts in there that need to be run before a
commit is recorded and exit with a non-zero status when the commit should be
aborted.

### Examples

See `pre-commit` for examples to reject commits that:

* would include files indented with tabs instead of spaces;
* would include Ruby debug statements (`binding.pry`)
* would include Git conflict markers (`<<<<<<<` and `>>>>>>>`)
* would include trailing whitespace

### Committing the hooks

Normally, Git hooks are local to a repository. They are not committed and
thefore not shared between developers. You could easily put your scripts in a
project directory such as `./hooks` and symlink them from there into your
`.git/hooks` directory.

If you do go this route, remember that everyone will need to create those
symlinks in order to use the hooks. A project setup script (such as
`./bin/setup`) would be a nice way to do so. Such a script might include some
lines like this:

    echo 'Setting up git hooks...'
    for hook in hooks/*
    do
      ln -sf ../../$hook .git/hooks/$(basename $hook)
    done

## Coffeelint

[Coffeelint][coffeelint] is a jshint-alternative for linting your coffee script
files and catch common style errors.

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

## Rubocop

[Rubocop][] checks Ruby code on style and metrics. It is configured using a
special `.rubocop.yml` file in the root of your project.

### Installation

Include Rubocop in your Gemfile:

    gem 'rubocop', group: 'development'
    gem 'rubocop-rspec', group: 'development'

Optionally install the Rake task to run RuboCop by copying `rubocop.rake` into
your Rails tasks directory (`lib/tasks`).

Finally, create a configuration file in the root of your project. You can simply
copy this repo's `./.rubocop.yml` into your project directory and modify it as
you see fit. The preferred way, however, is to create a custom, empty
configuration file in your project and _inherit_ settings from this file:

1. Copy this repo's `./.rubocop.yml` into your project as
   `./.rubocop_defaults.yml`.
2. Create a new `./.rubocop.yml` in your project.
3. Add the line `inherit_from: .rubocop_defaults.yml` to your `./.rubocop.yml`
   file.

You can now add more rules and customizations in your own file, and keep the
defaults in sync with the canonical style guide.

### Usage

You can run it using its own executable:

    $ rubocop

...or define a Rake task for it:

    $ rake rubocop

See `rubocop.rake` for an example. A Rake task is nice to include as a
dependency for a single `ci` task to run all tests on a continuous integration
server:

    # lib/tasks/ci.rake
    task ci: %i(spec cucumber rubocop)

### Configuration

Create a special `.rubocop.yml` file in the root of your project. Use it
to override any of the defaults from the [default
configuration][rubocop-defaults].


[Rubocop]: https://github.com/bbatsov/rubocop
[rubocop-defaults]: https://github.com/bbatsov/rubocop/blob/master/config/default.yml
[coffeelint]: http://www.coffeelint.org
