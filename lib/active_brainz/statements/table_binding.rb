# frozen_string_literal: true

require "delegate"

module ActiveBrainz
  module Statements
    class TableBinding < SimpleDelegator
      def render_binding
        binding
      end

      def class_name
        name.demodulize.camelize
      end

      def table_name
        name.demodulize
      end

      def gid?
        attributes.any? { |attribute| attribute.name == "gid" }
      end
    end
  end
end
