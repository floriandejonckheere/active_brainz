# frozen_string_literal: true

module ActiveBrainz
  class LabelAliasType < Base
    self.table_name = "label_alias_type"

    include HasGID
    include HasParentChildren

    has_many :label_aliases,
             class_name: "LabelAlias",
             foreign_key: "type"

    attribute :name
    attribute :description
  end
end

# == Schema Information
#
# Table name: label_alias_type
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
#  label_alias_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  label_alias_type_fk_parent  (parent => label_alias_type.id)
#
