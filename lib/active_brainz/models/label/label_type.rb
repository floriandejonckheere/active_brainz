# frozen_string_literal: true

module ActiveBrainz
  class LabelType < Base
    self.table_name = "label_type"

    include HasGID
    include HasParentChildren

    has_many :labels,
             class_name: "Label",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: label_type
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
#  label_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  label_type_fk_parent  (parent => label_type.id)
#
