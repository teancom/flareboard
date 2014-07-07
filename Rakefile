require 'rubygems'
require 'rubygems/package_task'
require 'yard'
spec = eval(File.read('flareboard.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end

YARD::Rake::YardocTask.new do |t|
  t.files = ['bin/flareboard']
end
