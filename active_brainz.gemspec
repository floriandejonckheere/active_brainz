# frozen_string_literal: true

require_relative "lib/active_brainz/version"

Gem::Specification.new do |spec|
  spec.name          = "active_brainz"
  spec.version       = ActiveBrainz::VERSION
  spec.authors       = ["Florian Dejonckheere"]
  spec.email         = ["florian@floriandejonckheere.be"]

  spec.summary       = "MusicBrainz ActiveRecord integration"
  spec.description   = "ActiveRecord integration with the MusicBrainz database"
  spec.homepage      = "https://github.com/floriandejonckheere/active_brainz"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6")

  spec.metadata["source_code_uri"] = "https://github.com/floriandejonckheere/active_brainz.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["README.md", "LICENSE.md", "Gemfile", "lib/active_brainz.rb",
                   "lib/active_brainz/version.rb", "lib/active_brainz/models/**/*.rb",
                   "config/inflections.rb"]
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency "pg"
  spec.add_runtime_dependency "zeitwerk"

  spec.add_development_dependency "activerecord-postgres_enum"
  spec.add_development_dependency "annotate"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "debase"
  spec.add_development_dependency "factory_bot"
  spec.add_development_dependency "fasterer"
  spec.add_development_dependency "ffaker"
  spec.add_development_dependency "flay"
  spec.add_development_dependency "overcommit"
  spec.add_development_dependency "pronto"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "timecop"
end
