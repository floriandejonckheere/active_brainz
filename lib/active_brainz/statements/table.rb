# frozen_string_literal: true

require "erb"

module ActiveBrainz
  module Statements
    class Table < Base
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def render!
        template = File.read ActiveBrainz.root.join("lib/active_brainz/models/model.rb.erb")

        File.open(ActiveBrainz.root.join("lib/active_brainz/models/#{name}.rb"), "w") do |f|
          f.write ERB.new(template).result(Binding.new(self).send(:binding))
        end
      end

      def uuid(_, **_); end

      def integer(_, **_); end

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
