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
          ActiveBrainz::Database.schema = ActiveBrainz::Statements::Schema.new("musicbrainz", info, block)
        end
      end

      require ActiveBrainz.root.join("db/schema.rb")

      ActiveBrainz::Database.schema.analyze!
      ActiveBrainz::Database.schema.render!
    end

    desc "Annotate models"
    task :annotate do
      require "annotate"

      options = Annotate
        .setup_options
        .merge models: "true",
               model_dir: ["lib/active_brainz/models"],
               classified_sort: "true",
               require: ["active_brainz"],
               trace: "true"

      ARGV.clear

      Annotate.eager_load(options)
      AnnotateModels.do_annotations(options)
    end
  end
end
# rubocop:enable Style/ClassAndModuleChildren
