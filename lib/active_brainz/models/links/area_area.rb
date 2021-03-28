# frozen_string_literal: true

module ActiveBrainz
  class AreaArea < Base
    self.table_name = "l_area_area"

    belongs_to :area0,
               class_name: "Area",
               foreign_key: "entity0"

    belongs_to :area1,
               class_name: "Area",
               foreign_key: "entity1"

    belongs_to :area_area_link,
               class_name: "Link",
               foreign_key: "link"

    attribute :entity0_credit
    attribute :entity1_credit

    attribute :link_order, :integer

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: l_area_area
#
#  id             :integer          not null, primary key
#  edits_pending  :integer          default(0), not null
#  entity0        :integer          not null
#  entity0_credit :text             default(""), not null
#  entity1        :integer          not null
#  entity1_credit :text             default(""), not null
#  last_updated   :datetime
#  link           :integer          not null
#  link_order     :integer          default(0), not null
#
# Indexes
#
#  l_area_area_idx_entity1  (entity1)
#  l_area_area_idx_uniq     (entity0,entity1,link,link_order) UNIQUE
#
# Foreign Keys
#
#  l_area_area_fk_entity0  (entity0 => area.id)
#  l_area_area_fk_entity1  (entity1 => area.id)
#  l_area_area_fk_link     (link => link.id)
#
