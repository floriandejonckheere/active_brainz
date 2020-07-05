# frozen_string_literal: true

require "erb"

module ActiveBrainz
  module Statements
    class Table < Base
      attr_reader :name,
                  :candidate_references

      def initialize(name)
        @name = name
        @candidate_references = {}
      end

      def render!
        template = File.read ActiveBrainz.root.join("lib/active_brainz/models/model.rb.erb")

        output = ERB.new(template, trim_mode: "-").result(binding)
        File.write ActiveBrainz.root.join("lib/active_brainz/models/#{name}.rb"), output
      end

      def class_name
        name.demodulize.camelize
      end

      def table_name
        name.demodulize
      end

      def references
        candidate_references
          .values
          .filter_map { |ref| ActiveBrainz::Database.schema.tables[ref.name] }
      end

      protected

      def integer(name, **options)
        candidate_references[name] = Reference.new(name, options)
      end

      def uuid(_, **_); end

      def string(_, **_); end

      def text(_, **_); end

      def date(_, **_); end

      def datetime(_, **_); end

      def time(_, **_); end

      def interval(_, **_); end

      def point(_, **_); end

      def boolean(_, **_); end

      def index(_, **_); end

      def jsonb(_, **_); end
    end
  end
end
