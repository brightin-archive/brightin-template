begin
  require "reek/rake/task"
  Reek::Rake::Task.new do |task|
    task.source_files = "{app,lib,spec}/**/*.rb"
    task.config_file = ".reek.yml"
    task.fail_on_error = true
  end
rescue LoadError
  task :reek do
    # no-op in environments where Reek is not installed
  end
end
