# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barking_iguana/unique_id/version'

Gem::Specification.new do |spec|
  spec.name          = "barking_iguana-unique_id"
  spec.version       = BarkingIguana::UniqueId::VERSION
  spec.authors       = ["Craig R Webster"]
  spec.email         = ["craig@barkingiguana.com"]
  spec.summary       = %q{Generate almost definitely unique IDs pretty easily.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency 'base_n'
end
