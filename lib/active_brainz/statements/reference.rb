# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Reference
      attr_reader :name,
                  :type,
                  :options,
                  :column,
                  :class_name

      def initialize(name, type, options = {})
        puts "#{name} == #{options[:column]}"
        @name = name == options[:column]&.to_s ? :"f_#{name}" : name
        @type = type
        @options = options

        @column = options[:column] || name
        @class_name = name.camelize
      end
    end
  end
end
