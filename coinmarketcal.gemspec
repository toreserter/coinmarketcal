# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coinmarketcal/version"

Gem::Specification.new do |spec|
  spec.name          = "coinmarketcal"
  spec.version       = Coinmarketcal::VERSION
  spec.authors       = ["Tore Serter"]
  spec.email         = ["toreserter@gmail.com"]

  spec.summary       = %q{Unofficial API Client for the CoinMarketCal API}
  spec.description   = %q{Unofficial API Client for the CoinMarketCal API}
  spec.homepage      = "https://github.com/toreserter/coinmarketcal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'faraday', '~> 0.12'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.12'

end
