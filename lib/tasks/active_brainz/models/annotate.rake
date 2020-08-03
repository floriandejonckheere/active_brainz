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
               classified_sort: "true",
               require: ["active_brainz"],
               trace: "true"

      ARGV.clear

      Annotate.eager_load(options)
      AnnotateModels.do_annotations(options)
    end
  end
end
