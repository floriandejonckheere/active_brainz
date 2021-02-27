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

      loader.collapse(root.join("lib/active_brainz/concerns"))
      loader.collapse(root.join("lib/active_brainz/models"))
      loader.collapse(root.join("lib/active_brainz/models/*"))

      # Do not eager load models, because they will try and connect to the database
      # This fails in Rails apps, because gems are loaded before the configuration
      # is initialized.
      loader.do_not_eager_load(root.join("lib/active_brainz/models"))

      loader.setup
      loader.eager_load

      # Load initializers
      Dir[root.join("config/initializers/*.rb")].sort.each { |f| require f }
    end
  end
end

ActiveBrainz.setup
