# frozen_string_literal: true

require "active_brainz"

namespace :active_brainz do
  namespace :models do
    desc "Generates models based on db/schema.rb file"
    task :generate do
      # Patch AR's schema definition DSL
      # rubocop:disable Lint/ConstantDefinitionInBlock
      module ActiveRecord
        class Schema
          def self.define(info = {}, &block)
            ActiveBrainz::Database.schema = ActiveBrainz::Statements::Schema.new("musicbrainz", info, block)
          end
        end
      end
      # rubocop:enable Lint/ConstantDefinitionInBlock

      require ActiveBrainz.root.join("db/schema.rb")

      ActiveBrainz::Database.schema.analyze!
      ActiveBrainz::Database.schema.render!

      puts "Generated #{ActiveBrainz::Database.schema.tables.count} models"
    end
  end
end
