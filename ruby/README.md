# Brightin style guide

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
