# frozen_string_literal: true

require "erb"

module ActiveBrainz
  module Statements
    class Table < Base
      attr_reader :references

      def initialize(name, info, block)
        super

        @references = {}
      end

      def render!
        template = File.read ActiveBrainz.root.join("lib/active_brainz/models/model.rb.erb")

        output = ERB.new(template, trim_mode: "-").result(TableBinding.new(self).render_binding)
        File.write ActiveBrainz.root.join("lib/active_brainz/models/#{name}.rb"), output
      end

      def integer(name, **options)
        table = ActiveBrainz::Database.schema.tables[name]

        return unless table

        references[name] = Reference.new(name, :belongs_to, options)
        table.references[self.name] = Reference.new(self.name, :has_many)
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
