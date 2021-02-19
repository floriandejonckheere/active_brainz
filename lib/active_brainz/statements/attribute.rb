# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Attribute
      attr_reader :name,
                  :type,
                  :options

      def initialize(name, type, options)
        @name = name
        @type = type
        @options = options
      end

      def to_s
        "#{name} (#{type})"
      end
    end
  end
end
