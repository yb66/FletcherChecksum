# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "fletcherchecksum/version"

Gem::Specification.new do |s|
  s.name        = "fletcherchecksum"
  s.version     = FletcherChecksum::VERSION
  s.authors     = ["Iain Barnett"]
  s.email       = ["iainspeed@gmail.com"]
  s.homepage    = "https://github.com/yb66/fletcherchecksum"
  s.summary     = %q{Fletcher checksums.}
  s.description = %q{Fletcher checksums, just give it a file path and it will give you a checksum for the file.}

  s.add_runtime_dependency 'sinatra', '~>1'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  s.license       = "MIT"
  s.extensions = %w[ext/fletcherchecksum/extconf.rb]
end
