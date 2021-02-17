# frozen_string_literal: true

require "active_brainz"

namespace :active_brainz do
  namespace :models do
    desc "Generate and annotate models"
    task render: [:generate, :annotate]
  end
end
