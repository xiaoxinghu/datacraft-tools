# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datacraft/tools/version'

Gem::Specification.new do |spec|
  spec.name          = "datacraft-tools"
  spec.version       = Datacraft::Tools::VERSION
  spec.authors       = ["Xiaoxing Hu"]
  spec.email         = ["dawnstar.hu@gmail.com"]

  spec.summary       = 'A set of tools to use out of the box with Datacraft.'
  spec.description   = 'This is the plugin set for Datacraft.'
  spec.homepage      = 'https://github.com/xiaoxinghu/datacraft-tools'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'nori', '~> 2.6'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
