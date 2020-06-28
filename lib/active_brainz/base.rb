# frozen_string_literal: true

require "active_record"

module ActiveBrainz
  class Base < ActiveRecord::Base
    def readonly?
      true
    end
  end
end