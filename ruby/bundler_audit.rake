desc 'Checks the Gemfile.lock for insecure dependencies'
task :bundler_audit do
  require 'bundler/audit'
  require 'bundler/audit/cli'
  Bundler::Audit::CLI.start(['update'])
  ignores =
    if File.exist?('bundlerauditignore')
      File.readlines('.bundlerauditignore').flat_map do |line|
        ['--ignore', line.chomp]
      end
    else
      []
    end
  Bundler::Audit::CLI.start(['check', *ignores])
end
