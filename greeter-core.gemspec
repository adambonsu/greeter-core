# frozen_string_literal: true

require_relative 'lib/greeter/core/version'

Gem::Specification.new do |spec|
  spec.name        = 'greeter-core'
  spec.version     = Greeter::Core::VERSION
  spec.authors     = ['Adam Bonsu']
  spec.summary     = 'Pure domain core and ports for the Greeter application.'
  spec.description = 'Framework-agnostic domain logic (GuestName, Greeting, ' \
                     'GreetingService) and driving/driven ports for Greeter, ' \
                     'with in-memory test doubles under Greeter::Core::Testing.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 3.3.0'

  # Ship lib only. Specs and dev config are not part of the packaged gem.
  spec.files = Dir['lib/**/*.rb'] + ['README.md', 'LICENCE']
  spec.require_paths = ['lib']

  spec.metadata['rubygems_mfa_required'] = 'true'

end