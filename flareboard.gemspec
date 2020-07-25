Gem::Specification.new do |s|
  s.name      = 'flareboard'
  s.version   = '0.0.2'
  s.platform  = Gem::Platform::RUBY
  s.authors   = 'David Bishop'
  s.email     = 'david at gnuconsulting dotcom'
  s.homepage  = 'http://github.com/teancom/flareboard'
  s.summary   = 'flareboard gets your cloudflare stats into statusboard'
  s.description = "flareboard allows you to display your CloudFlare statistics
                   in the Panic Software's StatusBoard app"
  s.license = 'ISC'
  s.files = ['bin/flareboard', 'README.md']
  s.executables = ['flareboard']
  s.add_dependency('json', '~> 2.3')
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('yard', '~> 0.9')
end
