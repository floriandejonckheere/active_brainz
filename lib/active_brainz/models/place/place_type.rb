# frozen_string_literal: true

module ActiveBrainz
  class PlaceType < Base
    self.table_name = "place_type"

    include HasGID
    include HasParentChildren

    has_many :places,
             class_name: "Place",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: place_type
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
#  place_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  place_type_fk_parent  (parent => place_type.id)
#
