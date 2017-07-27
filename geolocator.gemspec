# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geolocator/version'

Gem::Specification.new do |spec|
  spec.name          = 'geolocator'
  spec.version       = Geolocator::VERSION
  spec.authors       = ['Kalinichev Ilya']
  spec.email         = ['kalinichev@cryptopay.me']

  spec.summary       = %q{Yandex locator gem for rails}
  spec.description   = %q{determination of location, collection of monitoring data}
  spec.homepage      = 'http://mygemserver.com'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.respond_to?('metadata') ?
      spec.metadata['allowed_push_host'] = 'Set to http://mygemserver.com' :
      (raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.')

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'httparty'
end
