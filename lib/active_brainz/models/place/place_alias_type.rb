# frozen_string_literal: true

module ActiveBrainz
  class PlaceAliasType < Base
    self.table_name = "place_alias_type"

    include HasGID
    include HasParentChildren

    has_many :place_aliases,
             class_name: "PlaceAlias",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: place_alias_type
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
#  place_alias_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  place_alias_type_fk_parent  (parent => place_alias_type.id)
#
