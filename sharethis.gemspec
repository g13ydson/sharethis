# frozen_string_literal: true

require_relative "lib/sharethis/version"

Gem::Specification.new do |spec|
  spec.name = "sharethis"
  spec.version = Sharethis::VERSION
  spec.authors = ["Gleydson Tavares"]
  spec.email = ["tavares.gleydson@gmail.com"]

  spec.summary = "Helper for add social share in your Rails app. Twitter, Facebook etc..."
  spec.description = "Helper for add social share in your Rails app. Twitter, Facebook etc..."
  spec.homepage = "http://github.com/g13ydson/sharethis"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.9"
  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = `git ls-files`.split("\n")

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
