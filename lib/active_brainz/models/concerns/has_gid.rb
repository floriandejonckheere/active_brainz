# frozen_string_literal: true

module ActiveBrainz
  module HasGID
    extend ActiveSupport::Concern

    included do
      attribute :gid

      validates :gid,
                presence: true,
                uniqueness: true
    end
  end
end
