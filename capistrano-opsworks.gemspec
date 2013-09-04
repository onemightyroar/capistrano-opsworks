# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/opsworks/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-opsworks"
  spec.version       = Capistrano::Opsworks::VERSION
  spec.authors       = ["Brian Muse"]
  spec.email         = ["brian@onemightyroar.com"]
  spec.description   = "Opsworks deployment trigger for capistrano"
  spec.summary       = "Allows you to trigger a deployment for an opsworks application from a remote capistrano project"
  spec.homepage      = "http://brianmuse.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "aws-sdk"
end
