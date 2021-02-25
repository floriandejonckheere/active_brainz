# frozen_string_literal: true

module ActiveBrainz
  class Genre < Base
    self.table_name = "genre"

    include HasGID

    has_many :genre_aliases,
             class_name: "GenreAlias",
             foreign_key: "genre"

    attribute :name
    attribute :comment

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: genre
#
#  id            :integer          not null, primary key
#  comment       :string(255)      default(""), not null
#  edits_pending :integer          default(0), not null
#  gid           :uuid             not null
#  last_updated  :datetime
#  name          :string           not null
#
# Indexes
#
#  genre_idx_gid   (gid) UNIQUE
#  genre_idx_name  (lower((name)::text)) UNIQUE
#
