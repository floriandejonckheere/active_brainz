# frozen_string_literal: true

module ActiveBrainz
  class Database
    include Singleton

    class << self
      delegate_missing_to :instance
    end

    def connect!
      ActiveRecord::Base.establish_connection(configuration["musicbrainz"])
    end

    def configuration
      if defined?(Rails)
        Rails.application.config.database_configuration
      else
        ENV.fetch("DATABASE_URL") do
          require "yaml"

          YAML.load_file(ActiveBrainz.root.join("config/database.yml"))
        end
      end
    end
  end
end
