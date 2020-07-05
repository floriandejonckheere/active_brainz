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

    attr_accessor :schema
  end
end
