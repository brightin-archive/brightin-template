#!/usr/bin/env ruby
#
# = SimpleCov central configuration file
#
# This file sets up SimpleCov to generate code coverage reports. SimpleCov
# itself will look up and load this file when necessary.
#
# For more information on how to start, conigure and customise SimpleCov, see
# the SimpleCov documentation at:
#
#   https://github.com/colszowka/simplecov
#
SimpleCov.start "rails" do
  # = Grouping
  #
  # To categorise files and calculate coverage reports for groups of files,
  # use grouping.
  #
  # add_group "Decorators", "app/decorators"
  # add_group "Services", "app/services"

  # = Filtering
  #
  # Filter out files that should not be taken into account when building
  # coverage reports.
  #
  # add_filter 'lib/mailers/previews'

  # = Requirements
  #
  # Enforce certain levels of coverage, or changes in coverage, causing
  # SimpleCov to trigger a non-zero exit status when not met.
  #
  # Note that in order to refuse coverage drops, you need to persist information
  # about the last test run. This will usually not work in virtualized
  # Continuous Integration systems.
  #
  # minimum_coverage 95
  # minimum_coverage_by_file 80
  # maximum_coverage_drop 5
end

# = Customize formatters
#
# SimpleCov supports multiple formatters used at the same time. This can be
# used to generate reports in JSON or CSV formats, or to provide a summary
# at the end of your test run.
#
# To use the summary reporter, add the `simplecov-summary' gem to your Gemfile:
#
#   gem "simplecov-summary", require: false, group: :test
#
# Then, uncomment these lines:
#
# require "simplecov-summary"
# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   SimpleCov::Formatter::SummaryFormatter,
# ]
