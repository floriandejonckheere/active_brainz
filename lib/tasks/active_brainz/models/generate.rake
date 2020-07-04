# frozen_string_literal: true

require "active_brainz"

# rubocop:disable Style/ClassAndModuleChildren
namespace :active_brainz do
  namespace :models do
    desc "Generates models based on db/schema.rb file"
    task :generate do
      # Patch AR's schema definition DSL
      class ActiveRecord::Schema
        def self.define(info = {}, &block)
          ActiveBrainz::Database.schema.define(info, &block)
        end
      end

      require ActiveBrainz.root.join("db/schema.rb")

      ActiveBrainz::Database.schema.render!
    end
  end
end
# rubocop:enable Style/ClassAndModuleChildren
