# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tunnel/version"

Gem::Specification.new do |s|
  s.name        = "tunnel"
  s.version     = Tunnel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = "http://rubygems.org/gems/tunnel"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "tunnel"
  s.add_dependency "thor", "0.14.3"
  s.add_dependency "highline", "~> 1.6"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
