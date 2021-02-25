# frozen_string_literal: true

module ActiveBrainz
  class Area < Base
    self.table_name = "area"

    include HasGID
    include HasBeginEndDate

    belongs_to :area_type,
               class_name: "AreaType",
               foreign_key: "type",
               optional: true

    # has_many :area_aliases,
    #          class_name: "AreaAlias",
    #          foreign_key: "area"

    # has_many :area_annotations,
    #          class_name: "AreaAnnotation",
    #          foreign_key: "area"

    # has_many :area_attributes,
    #          class_name: "AreaAttribute",
    #          foreign_key: "area"

    # has_many :area_tag_raws,
    #          class_name: "AreaTagRaw",
    #          foreign_key: "area"

    # has_many :area_tags,
    #          class_name: "AreaTag",
    #          foreign_key: "area"

    has_many :area_artists,
             class_name: "Artist",
             foreign_key: "area"

    has_many :begin_area_artists,
             class_name: "Artist",
             foreign_key: "begin_area"

    has_many :end_area_artists,
             class_name: "Artist",
             foreign_key: "end_area"

    # has_many :area_country_areas,
    #          class_name: "CountryArea",
    #          foreign_key: "area"

    # has_many :area_edit_areas,
    #          class_name: "EditArea",
    #          foreign_key: "area"

    # has_many :area_editor_collection_areas,
    #          class_name: "EditorCollectionArea",
    #          foreign_key: "area"

    # has_many :area_editors,
    #          class_name: "Editor",
    #          foreign_key: "area"

    # has_many :area_iso_3166_1s,
    #          class_name: "Iso31661",
    #          foreign_key: "area"

    # has_many :area_iso_3166_2s,
    #          class_name: "Iso31662",
    #          foreign_key: "area"

    # has_many :area_iso_3166_3s,
    #          class_name: "Iso31663",
    #          foreign_key: "area"

    has_many :area_labels,
             class_name: "Label",
             foreign_key: "area"

    # has_many :area_new_ids,
    #          class_name: "AreaGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :area_places,
    #          class_name: "Place",
    #          foreign_key: "area"

    attribute :name
    attribute :comment

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
