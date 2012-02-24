# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "beta_invite"
  s.summary = "This is a basic platform for beta_invite."
  s.description = "This is a basic platform to beta_invite."
  s.files = Dir["{app,lib,config}/**/*"] + ["Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
  s.authors = ["QuadNode"]
end


