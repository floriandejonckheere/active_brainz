# frozen_string_literal: true

module ActiveBrainz
  class Place < Base
    self.table_name = "place"

    include HasGID
    include HasBeginEndDate

    # has_many :edit_places,
    #          class_name: "EditPlace",
    #          foreign_key: "place"

    # has_many :editor_collection_places,
    #          class_name: "EditorCollectionPlace",
    #          foreign_key: "place"

    has_many :place_aliases,
             class_name: "PlaceAlias",
             foreign_key: "place"

    # has_many :place_annotations,
    #          class_name: "PlaceAnnotation",
    #          foreign_key: "place"

    belongs_to :place_area,
               class_name: "Area",
               foreign_key: "area",
               optional: true

    # has_many :place_attributes,
    #          class_name: "PlaceAttribute",
    #          foreign_key: "place"

    # has_many :place_gid_redirects,
    #          class_name: "PlaceGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :place_tag_raws,
    #          class_name: "PlaceTagRaw",
    #          foreign_key: "place"

    # has_many :place_tags,
    #          class_name: "PlaceTag",
    #          foreign_key: "place"

    belongs_to :place_type,
               class_name: "PlaceType",
               foreign_key: "type",
               optional: true

    attribute :name
    attribute :comment

    attribute :coordinates, :point
    attribute :address

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: place
#
#  id               :integer          not null, primary key
#  address          :string           default(""), not null
#  area             :integer
#  begin_date_day   :integer
#  begin_date_month :integer
#  begin_date_year  :integer
#  comment          :string(255)      default(""), not null
#  coordinates      :point
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
#  place_idx_area      (area)
#  place_idx_geo       (ll_to_earth(coordinates[0], coordinates[1])) WHERE (coordinates IS NOT NULL) USING gist
#  place_idx_gid       (gid) UNIQUE
#  place_idx_name      (name)
#  place_idx_name_txt  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  place_fk_area  (area => area.id)
#  place_fk_type  (type => place_type.id)
#
