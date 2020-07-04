# frozen_string_literal: true

require "singleton"
require "yaml"

require "active_support/core_ext/module/delegation"

module ActiveBrainz
  class Database
    include Singleton

    class << self
      delegate_missing_to :instance
    end

    def schema
      @schema ||= ActiveBrainz::Statements::Schema.new
    end
  end
end
