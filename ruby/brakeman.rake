desc "Test for common security vulnerabilities"
task :brakeman, :output_files do |_t, args|
  require "brakeman"
  files = args[:output_files].split(" ") if args[:output_files]
  result = Brakeman.run(
    app_path:     ".",
    output_files: files,
    print_report: true,
    exit_on_warn: true,
    ignore_file:  ".brakeman"
  )
  if result.filtered_warnings.any?
    fail "Brakeman found #{result.filtered_warnings.count} warnings"
  end
end
