Gem::Specification.new do |s|
  s.name      = "flareboard"
  s.version   = "0.0.1"
  s.platform  = Gem::Platform::RUBY
  s.authors   = "David Bishop"
  s.email     = "david at gnuconsulting dotcom"
  s.homepage  = "http://github.com/teancom/flareboard"
  s.summary   = "flareboard gets your cloudflare stats into statusboard"
  s.description = %q{flareboard allows you to display your CloudFlare statistics
                     in the Panic Software's StatusBoard app} 
  s.license = "ISC"
  s.rubyforge_project = "flareboard"
  s.files = ["bin/flareboard"] 
  s.executables = ["flareboard"] 
  s.add_dependency("json")
  s.add_development_dependency("rake")
  s.add_development_dependency("yard")
end
