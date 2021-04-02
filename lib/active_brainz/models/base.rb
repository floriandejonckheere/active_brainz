# frozen_string_literal: true

require "active_record"
require "composite_primary_keys"

module ActiveBrainz
  class Base < ActiveRecord::Base
    self.abstract_class = true
    self.inheritance_column = nil

    establish_connection :musicbrainz

    def readonly?
      ENV["ACTIVE_BRAINZ_ENV"] != "test"
    end
  end
end
