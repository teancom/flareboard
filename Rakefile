require 'rubygems'
require 'rubygems/package_task'
require 'yard'
require 'erb'
require 'tmpdir'
require 'rake/testtask'

spec = eval(File.read('flareboard.gemspec'))

task :default => [:test]

YARD::Rake::YardocTask.new do |t|
  t.files = ['bin/flareboard']
end

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/*_test.rb']
  #t.verbose = true
end

namespace 'package' do
  Gem::PackageTask.new(spec) do |pkg|
  end

  desc 'Create an RPM spec file for packaging flareboard into an RPM'
  file 'rpm/flareboard.spec' => 'rpm/flareboard.spec.in' do
    version = spec.version.to_s
    template = ERB.new(File.read('rpm/flareboard.spec.in'), 0, '-').result(version.send(:binding))
    open('rpm/flareboard.spec', 'w+') do |f|
      f.puts(template)
    end
  end

  desc 'Build an RPM of the latest flareboard'
  task :rpm => ['rpm/flareboard.spec', 'package:gem'] do
    Dir.mktmpdir {|tmpdir|
      cp "pkg/flareboard-#{spec.version}.gem", tmpdir
      sh %Q{rpmbuild -D "_tmppath #{tmpdir}" -D "_builddir #{tmpdir}" -D "_sourcedir #{tmpdir}" -D "_rpmdir ./" -D "_rpmfilename rubygems-flareboard-#{spec.version}.noarch.rpm" -bb rpm/flareboard.spec}
    }
  end

end
