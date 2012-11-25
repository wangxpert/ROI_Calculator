require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rdoc/task'

gemspec = eval(File.read(Dir["*.gemspec"].first))

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/test_*.rb'
  test.verbose = false
end

RDoc::Task.new do |rd|
  README = 'README.rdoc'
  rd.main = README
  rd.rdoc_files.include(README, "lib/**/*.rb")
  rd.rdoc_dir = 'doc'
  rd.title = 'tax_cloud'
end

desc "Validate the gemspec"
task :gemspec do
  puts gemspec.validate
end

load 'vcr/tasks/vcr.rake'

task :default => :test
