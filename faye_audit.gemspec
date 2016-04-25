# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faye_audit/version'

Gem::Specification.new do |spec|
  spec.name          = "faye_audit"
  spec.version       = FayeAudit::VERSION
  spec.authors       = ["ShallmentMo"]
  spec.email         = ["ShallmentMo@gmail.com"]

  spec.summary       = "Audit faye in every monitoring event"
  spec.description   = "Audit faye in every monitoring event"
  spec.homepage      = "https://github.com/ShallmentMo/faye_audit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"

  spec.add_dependency "faye", "~> 1.1"
end
