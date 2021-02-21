# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Base
      attr_reader :name,
                  :info,
                  :block,
                  :enabled

      def initialize(name, info, block, enabled)
        @name = name
        @info = info
        @block = block
        @enabled = enabled
      end

      def analyze!
        instance_eval(&block)
      end
    end
  end
end
