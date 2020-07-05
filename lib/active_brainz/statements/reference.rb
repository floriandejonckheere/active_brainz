# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Reference
      attr_reader :name,
                  :type,
                  :options

      def initialize(name, type, options = {})
        @name = name
        @type = type
        @options = options
      end
    end
  end
end
