# Rake config file
require 'report_builder'
load 'report_builder.rake'

# report builder tasks
namespace 'report_builder' do
  task :smoke do
    sh 'cucumber -t @smoke f json -o ./reports/smoke_report.json'
  end
  task :crud do
    sh 'cucumber -t @CRUD f json -o ./reports/crud_report.json'
  end
  task :functional do
    sh 'cucumber -t @Functional f json -o ./reports/functional_report.json'
  end
end
# rubocop config
task default: :rubocop

task :rubocop do
  sh 'rubocop'
end
