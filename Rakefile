require 'rubygems'
require 'rake/gempackagetask'

PLUGIN = "merb_paperclip"
NAME = "merb_paperclip"
VERSION = "0.9.4"
AUTHOR = "Jeremy Durham"
EMAIL = "jeremydurham@gmail.com"
HOMEPAGE = "http://rubyforge.org/projects/merb_paperclip/"
SUMMARY = "A Merb plugin that is essentially a port of Jon Yurek's paperclip"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-core', '>= 0.9.4')
  s.add_dependency('merb-gen')
  s.require_path = 'lib'
  s.autorequire = PLUGIN
  s.files = %w(README Rakefile TODO) +
          Dir.glob("{lib,generators,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION}}
end

namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{SUDO} jruby -S gem install pkg/#{NAME}-#{Merb::VERSION}.gem --no-rdoc --no-ri}
  end
  
end