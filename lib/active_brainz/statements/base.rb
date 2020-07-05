# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Base
      attr_reader :name,
                  :info,
                  :block

      def initialize(name, info, block)
        @name = name
        @info = info
        @block = block
      end

      def analyze!
        instance_eval(&block)
      end
    end
  end
end
