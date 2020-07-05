# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Reference
      attr_reader :name,
                  :options

      def initialize(name, options)
        @name = name
        @options = options
      end
    end
  end
end
