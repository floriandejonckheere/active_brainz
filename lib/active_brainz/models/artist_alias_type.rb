# frozen_string_literal: true

module ActiveBrainz
  class ArtistAliasType < Base
    self.table_name = "artist_alias_type"

    include HasGID
    include HasParentChildren

    has_many :artist_aliases,
             class_name: "ArtistAlias",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: artist_alias_type
#
#  id          :integer          not null, primary key
#  child_order :integer          default(0), not null
#  description :text
#  gid         :uuid             not null
#  name        :text             not null
#  parent      :integer
#
# Indexes
#
#  artist_alias_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  artist_alias_type_fk_parent  (parent => artist_alias_type.id)
#
