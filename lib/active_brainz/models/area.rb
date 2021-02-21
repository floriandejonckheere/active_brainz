# frozen_string_literal: true

module ActiveBrainz
  class Area < Base
    self.table_name = "area"

    include HasGID
    include HasBeginEndDate

    has_many :area_artists,
             class_name: "Artist",
             foreign_key: "area"

    has_many :begin_area_artists,
             class_name: "Artist",
             foreign_key: "begin_area"

    has_many :end_area_artists,
             class_name: "Artist",
             foreign_key: "end_area"

    belongs_to :area_type,
               class_name: "AreaType",
               foreign_key: "type",
               optional: true

    attribute :name
    attribute :comment
    attribute :ended, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: area
#
#  id               :integer          not null, primary key
#  begin_date_day   :integer
#  begin_date_month :integer
#  begin_date_year  :integer
#  comment          :string(255)      default(""), not null
#  edits_pending    :integer          default(0), not null
#  end_date_day     :integer
#  end_date_month   :integer
#  end_date_year    :integer
#  ended            :boolean          default(FALSE), not null
#  gid              :uuid             not null
#  last_updated     :datetime
#  name             :string           not null
#  type             :integer
#
# Indexes
#
#  area_idx_gid       (gid) UNIQUE
#  area_idx_name      (name)
#  area_idx_name_txt  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  area_fk_type  (type => area_type.id)
#
