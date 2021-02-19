# frozen_string_literal: true

module ActiveBrainz
  module HasParentChildren
    extend ActiveSupport::Concern

    included do
      has_many :children,
               class_name: name.demodulize,
               foreign_key: "parent"

      belongs_to :parent,
                 class_name: name.demodulize,
                 foreign_key: "parent",
                 optional: true

      attribute :child_order, :integer
    end
  end
end
