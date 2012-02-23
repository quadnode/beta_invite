# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

$:.unshift(File.expand_path('../../lib', __FILE__))


#require 'spec/rails'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

