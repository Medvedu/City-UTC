# encoding: utf-8

require 'bundler'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task default: :spec

# Loads *.rake files from /tasks
Dir.entries(File.join(__dir__, 'tasks')).each do |file|
  load File.join(__dir__, 'tasks', file) if File.extname(file) == '.rake'
end
