# frozen_string_literal: true

module ActiveBrainz
  module Statements
    class Schema < Base
      def enable_extension(_); end

      def create_table(name, info = {}, &block)
        Table.new(name).define(info, &block)
      end
    end
  end
end
