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
        return unless Database::TABLES.include?(name)

        @tables[name] = Table.new(name, info, block)
      end

      def add_foreign_key(from_table, to_table, **options)
        return unless Database::TABLES.include?(from_table) && Database::TABLES.include?(to_table)
        return if %w(entity0 entity1).include? options[:column]

        tables[from_table].references << Reference.new(from_table, to_table, :belongs_to, options)
        tables[to_table].references << Reference.new(to_table, from_table, :has_many, options)
      end
    end
  end
end
