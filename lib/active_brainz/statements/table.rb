# frozen_string_literal: true

require "erb"

module ActiveBrainz
  module Statements
    class Table < Base
      attr_reader :primary_key, :references

      TEMPLATES = {
        model: File.read(ActiveBrainz.root.join("lib/active_brainz/models/model.rb.erb")),
        spec: File.read(ActiveBrainz.root.join("spec/active_brainz/models/model_spec.rb.erb")),
        factory: File.read(ActiveBrainz.root.join("spec/factories/models/model.rb.erb")),
      }.freeze

      def initialize(name, info, block)
        super

        @references = []
        @primary_key = info[:primary_key]
      end

      def render!
        # Render model
        render(TEMPLATES[:model], ActiveBrainz.root.join("lib/active_brainz/models/#{name}.rb"))

        # Render spec
        render(TEMPLATES[:spec], ActiveBrainz.root.join("spec/active_brainz/models/#{name}_spec.rb"))

        # Render factory
        render(TEMPLATES[:factory], ActiveBrainz.root.join("spec/factories/models/#{name}.rb"))
      end

      def column(_, *_); end

      def enum(_, **_); end

      def integer(_, **_); end

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

      def check_constraint(_, **_); end

      private

      def render(template, filename)
        return if File.exist?(filename)

        output = ERB.new(template, trim_mode: "-").result(TableBinding.new(self).render_binding)
        File.write filename, output
      end
    end
  end
end
