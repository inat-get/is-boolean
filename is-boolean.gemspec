# frozen_string_literal: true

require_relative 'lib/is-boolean/info'

Gem::Specification::new do |spec|

  spec.name = IS::Boolean::Info::NAME
  spec.version = IS::Boolean::Info::VERSION
  spec.summary = IS::Boolean::Info::SUMMARY
  spec.authors = [ IS::Boolean::Info::AUTHOR ]
  spec.license = IS::Boolean::Info::LICENSE
  spec.homepage = IS::Boolean::Info::HOMEPAGE

  spec.files = Dir[ 'lib/**/*', 'README.md', 'LICENSE' ]

  spec.required_ruby_version = '>= 3.4'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rdoc'
end
