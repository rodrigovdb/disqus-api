# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'disqus/version'

Gem::Specification.new do |spec|
  spec.name           = "disqus"
  spec.version        = Disqus::VERSION
  spec.authors        = ["Rodrigo Otavio van den Berg Maia (rodrigovdb)"]
  spec.email          = 'rodrigovdb@gmail.com'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Abstraction layer to Disqus' API}
  spec.description   = %q{Abstraction layer to Disqus' API - Get and manage disqus objects wia RESTful request}
  spec.homepage      = "https://github.com/rodrigovdb/disqus-api-client"
  spec.license       = "GPLv3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",    "~> 1.8"
  spec.add_development_dependency "rake",       "~> 10.0"
  spec.add_development_dependency "rspec",      "~> 3.2"
  spec.add_development_dependency "rubocop",    "~> 0.34"
  spec.add_development_dependency "simplecov",  "~> 0.10"

  spec.add_runtime_dependency "dotenv", "~> 2.0"
  spec.add_runtime_dependency "curb",   "~> 0.9"
end
