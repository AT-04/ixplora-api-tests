# Rake config file
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'report_builder'

# report builder tasks
desc 'Task to build the json report'
task :json_report, [:tag] do |t, args|
  sh "cucumber -t @#{args.tag} -f json -o features/reports/#{args.tag}/report.json"
end
desc 'Task to build the html report'
task :html_report, [:tag] do |t, args|
  ReportBuilder.configure do |config|
    config.json_path = "features/reports/#{args.tag}/"
    config.report_path = "features/reports/#{args.tag}/report"
    config.report_types = [:html]
    config.report_title = 'Ixplora Reports'
    config.include_images = false
  end
  ReportBuilder.build_report
end
task :reports, [:tag] do |t, args|
  sh "rake json_report['#{args.tag}']"
  sh "rake html_report['#{args.tag}']"
end
# rubocop config
task default: :rubocop

task :rubocop do
  sh 'rubocop'
end
