# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/sensu/version'

Gem::Specification.new do |spec|
  spec.name          = 'itamae-plugin-recipe-sensu'
  spec.version       = Itamae::Plugin::Recipe::Sensu::VERSION
  spec.authors       = ['Daisuke Hirakiuchi']
  spec.email         = ['devops@leonisand.co']

  spec.summary       = 'Itamae plugin to install sensu.'
  spec.description   = 'Itamae plugin to install sensu server/client/api by package'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'itamae', '~> 1.2'

  spec.add_runtime_dependency 'itamae-plugin-recipe-erlang'
  spec.add_runtime_dependency 'itamae-plugin-recipe-rabbitmq'
  spec.add_runtime_dependency 'itamae-plugin-recipe-redis'
end
