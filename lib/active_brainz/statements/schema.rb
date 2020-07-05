# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Schema < Base
      attr_reader :tables

      def initialize(name, info, block)
        super

        @tables = {}
      end

      def analyze!
        super

        tables.each_value(&:analyze!)
      end

      def render!
        tables.each_value(&:render!)
      end

      protected

      def enable_extension(_); end

      def create_table(name, info = {}, &block)
        @tables[name] = Table.new(name, info, block)
      end
    end
  end
end
