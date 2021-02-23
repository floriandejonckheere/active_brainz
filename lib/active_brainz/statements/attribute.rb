# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Attribute
      attr_reader :name,
                  :type,
                  :options

      def initialize(name, type, options)
        @name = name
        @type = type
        @options = options
      end

      def to_s
        "#{name} (#{type})"
      end

      # Fake value used in factory
      def ffaked_value
        {
          name: "FFaker::Name.name",
          description: "FFaker::Lorem.sentence",
          comment: "FFaker::Lorem.sentence",
          edits_pending: "FFaker::Random.rand(10)",
          ref_count: "FFaker::Random.rand(10)",
          locale: "FFaker::Locale.code",
        }.fetch(name.to_sym, {
          integer: "FFaker::Random.rand(10)",
          datetime: "FFaker::Time.datetime",
          date: "FFaker::Time.date",
          boolean: "[true, false].sample",
        }.fetch(type, "FFaker::Lorem.word"),)
      end
    end
  end
end
