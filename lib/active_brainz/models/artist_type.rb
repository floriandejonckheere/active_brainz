# frozen_string_literal: true

module ActiveBrainz
  class ArtistType < Base
    self.table_name = "artist_type"

    include HasGID

    has_many :artist_type_artists,
             class_name: "Artist",
             foreign_key: "type"

    has_many :artist_type_children,
             class_name: "ArtistType",
             foreign_key: "parent"

    belongs_to :artist_type_parent,
               class_name: "ArtistType",
               foreign_key: "parent",
               optional: true

    attribute :name
    attribute :description

    attribute :child_order, :integer
  end
end

# == Schema Information
#
# Table name: artist_type
#
#  id          :integer          not null, primary key
#  child_order :integer          default(0), not null
#  description :text
#  gid         :uuid             not null
#  name        :string(255)      not null
#  parent      :integer
#
# Indexes
#
#  artist_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  artist_type_fk_parent  (parent => artist_type.id)
#
