# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Schema < Base
      attr_reader :tables

      def initialize
        @tables = {}
      end

      def enable_extension(_); end

      def create_table(name, info = {}, &block)
        @tables[name] = Table.new(name).tap { |t| t.define(info, &block) }
      end

      def render!
        tables.each_value(&:render!)
      end
    end
  end
end
