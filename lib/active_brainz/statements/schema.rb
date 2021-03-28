# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Schema < Base
      attr_reader :tables

      def initialize(name, info, block, enabled)
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
        @tables[name] = Table.new(name, info, block, Database::TABLES.include?(name))
      end

      def add_foreign_key(from_table, to_table, **options)
        enabled = tables[from_table].enabled && tables[to_table].enabled

        tables[from_table].references << Reference.new(from_table, to_table, :belongs_to, enabled, options)
        tables[to_table].references << Reference.new(to_table, from_table, :has_many, enabled, options)
      end
    end
  end
end
