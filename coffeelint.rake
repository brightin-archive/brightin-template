# Wrapper around coffeelint to lint all asset pipeline coffeescript files.
task :coffeelint do
  desc 'Lint all Coffee script files in ./app and ./lib'
  sh 'coffeelint',
     '--file',
     Rails.root.join('.coffeelint.json').to_s,
     *FileList['{app,lib}/assets/javascripts/**/*.coffee']
end
