# frozen_string_literal: true

module ActiveBrainz
  class AreaType < Base
    self.table_name = "area_type"

    include HasGID
    include HasParentChildren

    has_many :areas,
             class_name: "Area",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: area_type
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
#  area_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  area_type_fk_parent  (parent => area_type.id)
#
