# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Reference
      attr_reader :from_table,
                  :to_table,
                  :type,
                  :enabled,
                  :options,
                  :column,
                  :name,
                  :class_name

      # Nullability is only set when table columns are parsed
      attr_accessor :null

      def initialize(from_table, to_table, type, enabled, options = {})
        @from_table = from_table
        @to_table = to_table
        @type = type
        @enabled = enabled
        @options = options

        @column = options[:column]
        @name = generate_name
        @class_name = to_table.camelize
      end

      def generate_name
        # References are always named after their target tables,
        # pluralized for has_many references and prefixed with the
        # origin table name for belongs_to references.
        name = to_table
        name = name.pluralize if type == :has_many
        name = "#{from_table}_#{name}" if name == column
        name.delete_prefix("l_")
      end

      def to_s
        "#{from_table} #{type} #{to_table}"
      end
    end
  end
end
