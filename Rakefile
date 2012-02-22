# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
#require 'rake/rdoctask'

#require 'spec/rake/spectask'
#require 'spec'

#require 'cucumber'
#require 'cucumber/rake/task'
require 'rdoc/task'

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :cucumber do

Cucumber::Rake::Task.new(:authentication2) do |t|
  t.cucumber_opts = "features/Authentication.feature"
end


Cucumber::Rake::Task.new(:preview_all) do |t|
  t.cucumber_opts = "features/Preview.feature features/PreviewButton.feature"
end
end
