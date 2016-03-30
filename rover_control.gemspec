# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rover_control/version'

Gem::Specification.new do |spec|
  spec.name          = "rover_control"
  spec.version       = RoverControl::VERSION
  spec.authors       = ["Thiago von Sydow"]
  spec.email         = ["thiagovs05@gmail.com"]

  spec.summary       = %q{A simple Nasa Rover command control.}
  spec.homepage      = "https://github.com/thiago-sydow/rover_control"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end
