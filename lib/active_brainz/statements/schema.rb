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

      def add_foreign_key(from_table, to_table, **options)
        tables[from_table].references[to_table] = Reference.new(to_table, :belongs_to, options)
        tables[to_table].references[from_table] = Reference.new(from_table, :has_many, options)
      end
    end
  end
end
