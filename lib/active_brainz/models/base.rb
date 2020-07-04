# frozen_string_literal: true

require "active_record"

module ActiveBrainz
  class Base < ActiveRecord::Base
    self.abstract_class = true
    self.inheritance_column = nil

    establish_connection :musicbrainz

    def readonly?
      true
    end
  end
end
