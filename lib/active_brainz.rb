# frozen_string_literal: true

require "zeitwerk"
require "byebug" if ENV["ACTIVE_BRAINZ_ENV"] == "development"
require "active_support/all"

module ActiveBrainz
  class << self
    # Code loader instance
    attr_reader :loader

    def root
      @root ||= Pathname.new(File.expand_path(File.join("..", ".."), __FILE__))
    end

    def setup
      @loader = Zeitwerk::Loader.for_gem

      # Register inflections
      require root.join("config/inflections.rb")

      # Set up code loader
      loader.enable_reloading if ENV["ACTIVE_BRAINZ_ENV"] == "development"
      loader.collapse("lib/active_brainz/models")
      loader.collapse("lib/active_brainz/models/concerns")

      loader.setup
      loader.eager_load

      # Load initializers
      Dir[root.join("config/initializers/*.rb")].sort.each { |f| require f }
    end
  end
end

ActiveBrainz.setup
