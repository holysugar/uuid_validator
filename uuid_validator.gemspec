# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uuid_validator/version'

Gem::Specification.new do |gem|
  gem.name          = "uuid_validator"
  gem.version       = UuidValidator::VERSION
  gem.authors       = ["HORII Keima"]
  gem.email         = ["holysugar@gmail.com"]
  gem.description   = %q{UUID Validator for ActiveModel}
  gem.summary       = %q{UUID Validator for ActiveModel}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "activemodel", ">= 3.0.0"

  gem.add_development_dependency "uuidtools"
end
