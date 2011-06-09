# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cove_video_service/version"

Gem::Specification.new do |s|
  s.name        = "cove_video_service"
  s.version     = CoveVideoService::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Weald"]
  s.email       = ["ryan@weald.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "cove_video_service"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rack-test"

  s.add_dependency "thin"
  s.add_dependency "sinatra"
  s.add_dependency "yajl-ruby"
  s.add_dependency "redis"
  s.add_dependency "redis-namespace"

end
