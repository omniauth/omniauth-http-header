lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-http-header/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-http-header"
  spec.version       = OmniAuth::HttpHeader::VERSION
  spec.authors       = ["Markus Koller"]
  spec.email         = ["markus.koller.ext@siemens.com"]

  spec.summary       = "OmniAuth strategy using custom HTTP headers"
  spec.homepage      = "https://github.com/omniauth/omniauth-http-header"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1"

  spec.add_runtime_dependency "omniauth", "~> 1.4"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
end
