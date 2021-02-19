# frozen_string_literal: true

require "active_record"

ActiveRecord::Base.configurations = {
  musicbrainz: {
    adapter: "postgresql",
    encoding: "unicode",
    pool: 5,
    host: ENV.fetch("PG_HOST", "localhost"),
    username: ENV.fetch("PG_USER", "musicbrainz"),
    password: ENV.fetch("PG_PASSWORD", "musicbrainz"),
    database: ENV.fetch("PG_DATABASE", "musicbrainz_db"),
  },
}
