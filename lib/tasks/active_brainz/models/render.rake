# frozen_string_literal: true

# Load database configuration
require_relative "../../../../config/database"

require "active_brainz"

namespace :active_brainz do
  namespace :models do
    desc "Generate and annotate models"
    task render: [:generate, :annotate]
  end
end
