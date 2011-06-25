require 'rake'
require 'rake/testtask'
require 'rake/clean'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "trd"
    gemspec.summary = "Treasure Data command line tool"
    gemspec.authors = ["Sadayuki Furuhashi"]
    #gemspec.email = "frsyuki@users.sourceforge.jp"
    #gemspec.homepage = "http://example.com/"
    gemspec.has_rdoc = false
    gemspec.require_paths = ["lib"]
    gemspec.add_dependency "json", ">= 1.4.3"
    gemspec.add_dependency "hirb", ">= 0.4.5"
    gemspec.test_files = Dir["test/**/*.rt"]
    gemspec.files = Dir["lib/**/*", "ext/**/*", "test/**/*.rb", "test/**/*.rt"]
    gemspec.executables = ['trd']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

VERSION_FILE = "lib/trd/version.rb"

file VERSION_FILE => ["VERSION"] do |t|
  version = File.read("VERSION").strip
  File.open(VERSION_FILE, "w") {|f|
    f.write <<EOF
module TRD

VERSION = '#{version}'

end
EOF
  }
end

task :default => [VERSION_FILE, :build]

