# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Attribute
      attr_reader :name,
                  :type

      def initialize(name, type)
        @name = name
        @type = type
      end
    end
  end
end