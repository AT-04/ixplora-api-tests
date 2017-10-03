# Rake config file
require 'report_builder'
load 'report_builder.rake'
task default: 'report_builder:test_everything'
task default: :rubocop

task :rubocop do
  sh 'rubocop'
end
