require "bundler/gem_tasks"
require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.libs << %w[test lib]
  t.pattern = 'test/*_test.rb'
  t.warning = true
  t.verbose = true
end

