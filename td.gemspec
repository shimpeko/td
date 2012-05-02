# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "td"
  s.version = "0.10.23"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sadayuki Furuhashi"]
  s.date = "2012-05-01"
  s.executables = ["td"]
  s.extra_rdoc_files = [
    "ChangeLog",
    "README.rdoc"
  ]
  s.files = [
    "data/sample_apache.json",
    "data/sample_apache_gen.rb",
    "lib/td.rb",
    "lib/td/command/account.rb",
    "lib/td/command/aggr.rb",
    "lib/td/command/apikey.rb",
    "lib/td/command/common.rb",
    "lib/td/command/db.rb",
    "lib/td/command/export.rb",
    "lib/td/command/help.rb",
    "lib/td/command/import.rb",
    "lib/td/command/job.rb",
    "lib/td/command/list.rb",
    "lib/td/command/query.rb",
    "lib/td/command/result.rb",
    "lib/td/command/runner.rb",
    "lib/td/command/sample.rb",
    "lib/td/command/sched.rb",
    "lib/td/command/schema.rb",
    "lib/td/command/server.rb",
    "lib/td/command/status.rb",
    "lib/td/command/table.rb",
    "lib/td/config.rb",
    "lib/td/distribution.rb",
    "lib/td/version.rb"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Treasure Data command line tool"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<msgpack>, ["~> 0.4.4"])
      s.add_runtime_dependency(%q<json>, [">= 1.4.3"])
      s.add_runtime_dependency(%q<hirb>, [">= 0.4.5"])
      s.add_runtime_dependency(%q<td-client>, ["~> 0.8.15"])
      s.add_runtime_dependency(%q<td-logger>, ["~> 0.3.8"])
    else
      s.add_dependency(%q<msgpack>, ["~> 0.4.4"])
      s.add_dependency(%q<json>, [">= 1.4.3"])
      s.add_dependency(%q<hirb>, [">= 0.4.5"])
      s.add_dependency(%q<td-client>, ["~> 0.8.15"])
      s.add_dependency(%q<td-logger>, ["~> 0.3.8"])
    end
  else
    s.add_dependency(%q<msgpack>, ["~> 0.4.4"])
    s.add_dependency(%q<json>, [">= 1.4.3"])
    s.add_dependency(%q<hirb>, [">= 0.4.5"])
    s.add_dependency(%q<td-client>, ["~> 0.8.15"])
    s.add_dependency(%q<td-logger>, ["~> 0.3.8"])
  end
end

