# frozen_string_literal: true

module ActiveBrainz
  class Gender < Base
    self.table_name = "gender"

    include HasGID

    has_many :gender_artists,
             class_name: "Artist",
             foreign_key: "gender"

    has_many :gender_children,
             class_name: "Gender",
             foreign_key: "parent"

    belongs_to :gender_parent,
               class_name: "Gender",
               foreign_key: "parent",
               optional: true

    attribute :child_order, :integer
    attribute :description
    attribute :name
  end
end

# == Schema Information
#
# Table name: gender
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
#  gender_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  gender_fk_parent  (parent => gender.id)
#
