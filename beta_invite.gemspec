# CURRENT FILE :: team_page.gemspec
require File.expand_path("../lib/beta_invite/version", __FILE__)

# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name                      = "beta_invite"
  s.version                   = BetaInvite::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = [ "Harsha" ]
  s.email                     = [ "harsha@quadnode.com" ]
  s.homepage                  = "http://quadnode.com"
  s.description               = "Install this gem to allow users to request for a Beta-Invite for your app."
  s.summary                   = "Beta Invite version-#{s.version}"
  

  #s.required_rubygems_version = "> 1.3.6"

  s.add_dependency "rails"    , ">=3.1.0"
  s.add_dependency "kaminari" 
  s.add_dependency "delayed_job_active_record" 
  

  s.files = Dir["{app,lib,config,vendor,public}/**/*"] + ["Rakefile", "Gemfile", "README.rdoc"]
  s.require_path = 'lib'
end
