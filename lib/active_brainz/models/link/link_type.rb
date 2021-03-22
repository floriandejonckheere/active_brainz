# frozen_string_literal: true

module ActiveBrainz
  class LinkType < Base
    self.table_name = "link_type"

    include HasGID
    include HasParentChildren

    # has_many :link_type_attribute_types,
    #          class_name: "LinkTypeAttributeType",
    #          foreign_key: "link_type"

    has_many :links,
             class_name: "Link",
             foreign_key: "link_type"

    # has_many :orderable_link_types,
    #          class_name: "OrderableLinkType",
    #          foreign_key: "link_type"

    attribute :name
    attribute :description

    attribute :has_dates, :boolean

    attribute :is_deprecated, :boolean
    attribute :priority, :integer

    attribute :entity0_cardinality, :integer
    attribute :entity1_cardinality, :integer

    attribute :entity_type0
    attribute :entity_type1

    attribute :link_phrase
    attribute :long_link_phrase
    attribute :reverse_link_phrase

    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: link_type
#
#  id                  :integer          not null, primary key
#  child_order         :integer          default(0), not null
#  description         :text
#  entity0_cardinality :integer          default(0), not null
#  entity1_cardinality :integer          default(0), not null
#  entity_type0        :string(50)       not null
#  entity_type1        :string(50)       not null
#  gid                 :uuid             not null
#  has_dates           :boolean          default(TRUE), not null
#  is_deprecated       :boolean          default(FALSE), not null
#  last_updated        :datetime
#  link_phrase         :string(255)      not null
#  long_link_phrase    :string(255)      not null
#  name                :string(255)      not null
#  parent              :integer
#  priority            :integer          default(0), not null
#  reverse_link_phrase :string(255)      not null
#
# Indexes
#
#  link_type_idx_gid  (gid) UNIQUE
#
# Foreign Keys
#
#  link_type_fk_parent  (parent => link_type.id)
#
