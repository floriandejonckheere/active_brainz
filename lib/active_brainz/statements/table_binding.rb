# frozen_string_literal: true

require "delegate"

module ActiveBrainz
  module Statements
    class TableBinding < SimpleDelegator
      FILTERED_ATTRIBUTES = %w(
        begin_date_year
        begin_date_month
        begin_date_day
        end_date_year
        end_date_month
        end_date_day
        gid
      ).freeze

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

      def begin_end_date?
        %w(begin_date_year begin_date_month begin_date_day end_date_year end_date_month end_date_day)
          .all? { |name| attributes.any? { |attribute| attribute.name == name } }
      end

      def filtered_attributes
        attributes.reject { |attr| FILTERED_ATTRIBUTES.include? attr.name }
      end
    end
  end
end
