# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cdc/version'

Gem::Specification.new do |gem|
  gem.name          = "cdc"
  gem.version       = Cdc::VERSION
  gem.authors       = ["Tomas Mattia"]
  gem.email         = ["tmattia@thoughtworks.com"]
  gem.description   = %q{Consumer-Driven Contracts in Ruby}
  gem.summary       = %q{Consumer-Driven Contracts in Ruby}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  #gem.add_dependency 'dependo'
  gem.add_dependency 'json-schema'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
