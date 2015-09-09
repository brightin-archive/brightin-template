desc 'Checks the Gemfile.lock for insecure dependencies'
task :bundle_audit do
  require 'bundler/audit'
  require 'bundler/audit/cli'
  Bundler::Audit::CLI.start(['update'])
  Bundler::Audit::CLI.start(['check'])
end
