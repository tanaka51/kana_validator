# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kana_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "kana_validator"
  spec.version       = KanaValidator::VERSION
  spec.authors       = ["Koichi Tanaka"]
  spec.email         = ["tanaka51.jp@gmail.com"]
  spec.summary       = %q{Rails 3+ validator for ひらがな and かたかな.}
  spec.description   = %q{Rails 3+ validator for ひらがな and かたかな.}
  spec.homepage      = "http://github.com/tanaka51-jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
