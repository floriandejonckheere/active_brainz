# frozen_string_literal: true

require "date"

module ActiveBrainz
  module Version
    MAJOR = 0
    MINOR = 2
    PATCH = 0
    PRE   = nil

    VERSION = [MAJOR, MINOR, PATCH].compact.join(".")

    STRING = [VERSION, PRE].compact.join("-")
  end

  # Version of MusicBrainz' SQL schema
  SCHEMA_VERSION = 25

  # Publication date of MusicBrainz' SQL schema
  SCHEMA_DATE = Date.new(2021, 2, 13)

  VERSION = ActiveBrainz::Version::STRING
end
