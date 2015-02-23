# Brightin style guide

## Reek

[Reek][] is a tool that examines Ruby classes, modules and methods and reports any
code smells it finds.

### Installation

Include Reek in your Gemfile:

    gem 'reek', group: 'development', require: false

Optionally install the Rake task to run Reek by copying `reek.rake` into your
Rails tasks directory (`lib/tasks`).

### Usage

You can run Reek using its own executable:

    % reek

Or use this repository's Rake task:

    % rake reek

See `reek.rake` for an example. A Rake task is nice to include as a
dependency for a single `ci` task to run all tests on a continuous integration
server:

    # lib/tasks/ci.rake
    task ci: %i(spec cucumber brakeman)

### Configuration

Reek will look for a `.reek` file in your current directory, or ascend up the
directory tree up to your home directory. You can pass an explicit filename to
`reek` if you want to (see `reek -h` for options). The Rake task in this
repository will have Reek look for a `.reek.yml` file, in line with RuboCop's
`.rubocop.yml`.

## Brakeman

[Brakeman][] is a static analysis tool that checks for common security
vulnerabilities in Ruby on Rails projects.

### Installation

Include Brakeman in your Gemfile:

    gem 'brakeman', group: 'development', require: false

Optionally install the Rake task to run Brakeman by copying `brakeman.rake` into
your Rails tasks directory (`lib/tasks`).

### Usage

You can run Brakeman using its own executable:

    % brakeman

Or use this repository's Rake task:

    % rake brakeman

See `brakeman.rake` for an example. A Rake task is nice to include as a
dependency for a single `ci` task to run all tests on a continuous integration
server:

    # lib/tasks/ci.rake
    task ci: %i(spec cucumber brakeman)

### Configuration

Brakeman mostly works out-of-the-box, but if you have any particular
vulnerabilities you would like to ignore, you can create an ignore file. By
default, Brakeman looks for a `config/brakeman.ignore` file, but you can also
explicitly point to your own path. **Tip** the included Rake task will have
Brakeman look for a `./.brakeman` file instead.

Refer to the Brakeman documentation on how to create and manage an ignore file.
As per this writing, the gist of it is to run:

    % brakeman -I

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
[Reek]: https://github.com/troessner/reek
