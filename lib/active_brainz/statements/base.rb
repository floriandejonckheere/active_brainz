# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Base
      def define(_info, &block)
        instance_eval(&block)
      end
    end
  end
end
