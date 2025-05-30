# frozen_string_literal: true

require_relative "lib/operation_model_scaffold/version"

Gem::Specification.new do |spec|
  spec.name          = "operation_model_scaffold"
  spec.version       = OperationModelScaffold::VERSION
  spec.authors       = ["shu0115"]
  spec.email         = ["s.matsumoto0115@gmail.com"]

  spec.summary       = "Rails generator for creating an Operations layer scaffold."
  spec.description   = "This gem provides a generator to scaffold an Operations layer in your Rails app, helping structure application logic in a modular and maintainable way."

  spec.homepage      = "https://github.com/shu0115/operation_model_scaffold"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/shu0115/operation_model_scaffold"
  spec.metadata["changelog_uri"]   = "https://github.com/shu0115/operation_model_scaffold/releases"

  # allowed_push_host is only needed if you push to a private gem server
  # It is not required for public RubyGems.org
  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Add runtime dependencies here, if any.
  spec.add_dependency "rails"
end
