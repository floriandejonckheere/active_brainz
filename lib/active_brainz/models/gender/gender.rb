# frozen_string_literal: true

module ActiveBrainz
  class Gender < Base
    self.table_name = "gender"

    include HasGID
    include HasParentChildren

    has_many :artists,
             class_name: "Artist",
             foreign_key: "gender"

    # has_many :editors,
    #          class_name: "Editor",
    #          foreign_key: "gender"

    attribute :name
    attribute :description
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
