# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Binding
      attr_reader :table

      def initialize(table)
        @table = table
      end

      def class_name
        table.name.demodulize.camelize
      end

      def table_name
        table.name.demodulize
      end
    end
  end
end
