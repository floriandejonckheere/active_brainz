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
        ended
        entity0
        entity1
        gid
        child_order
      ).freeze

      FILTERED_REFERENCES = %w(
        parent
      ).freeze

      ATTRIBUTE_SORT_ORDER = %w(
        name
        sort_name
        description
        comment
        locale
        primary_for_locale
        edits_pending
        last_updated
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
        %w(begin_date_year begin_date_month begin_date_day end_date_year end_date_month end_date_day ended)
          .all? { |name| attributes.any? { |attribute| attribute.name == name } }
      end

      def child_order?
        attributes.any? { |attribute| attribute.name == "child_order" }
      end

      def filtered_attributes
        attributes
          .reject { |attr| FILTERED_ATTRIBUTES.include? attr.name }
          .sort_by { |ref| [ATTRIBUTE_SORT_ORDER.index(ref.name) || 99, ref.type, ref.name] }
      end

      def filtered_references
        references
          .reject { |ref| FILTERED_REFERENCES.include? ref.column }
          .sort_by(&:name)
      end
    end
  end
end
