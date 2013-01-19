# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "asakusa-rss-monitor/version"

Gem::Specification.new do |s|
  s.name        = "asakusa-rss-monitor"
  s.version     = AsakusaRssMonitor::VERSION
  s.authors     = ["3100"]
  s.email       = ["sugar16g@gmail.com"]
  s.homepage    = "https://github.com/3100/asakusa-rss-monitor"
  s.summary     = %q{Posting rss updates to a room in your AsakusaSatellite.}
  s.description = %q{Posting rss updates to a room in your AsakusaSatellite. To monitor rss with this script, you need to use a cron job.}

  s.rubyforge_project = "asakusa-rss-monitor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
