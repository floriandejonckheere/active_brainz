# frozen_string_literal: true

require "active_brainz"

namespace :active_brainz do
  namespace :models do
    desc "Annotate models"
    task :annotate do
      require "annotate"

      options = Annotate
        .setup_options
        .merge models: "true",
               model_dir: ["lib/active_brainz/models"],
               position: "after",
               position_in_class: "after",
               show_indexes: true,
               show_foreign_keys: true,
               classified_sort: "true",
               require: ["active_brainz"],
               trace: "true"

      ARGV.clear

      # Patch annotate_model's integration with ActiveSupport::Inflector
      # rubocop:disable Lint/ConstantDefinitionInBlock
      module AnnotateModels
        def self.get_loaded_model(model_path, file)
          "active_brainz/#{model_path}".camelize.constantize
        rescue LoadError
          super
        end
      end
      # rubocop:enable Lint/ConstantDefinitionInBlock

      Annotate.eager_load(options)
      AnnotateModels.do_annotations(options)
    end
  end
end
