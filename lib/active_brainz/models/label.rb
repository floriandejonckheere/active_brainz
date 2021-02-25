# frozen_string_literal: true

module ActiveBrainz
  class Label < Base
    self.table_name = "label"

    include HasGID
    include HasBeginEndDate

    belongs_to :label_area,
               class_name: "Area",
               foreign_key: "area",
               optional: true

    belongs_to :label_type,
               class_name: "LabelType",
               foreign_key: "type",
               optional: true

    # has_many :edit_labels,
    #          class_name: "EditLabel",
    #          foreign_key: "label"

    # has_many :editor_collection_labels,
    #          class_name: "EditorCollectionLabel",
    #          foreign_key: "label"

    # has_many :editor_subscribe_labels,
    #          class_name: "EditorSubscribeLabel",
    #          foreign_key: "label"

    has_many :label_aliases,
             class_name: "LabelAlias",
             foreign_key: "label"

    # has_many :label_annotations,
    #          class_name: "LabelAnnotation",
    #          foreign_key: "label"

    # has_many :label_attributes,
    #          class_name: "LabelAttribute",
    #          foreign_key: "label"

    # has_many :label_gid_redirects,
    #          class_name: "LabelGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :label_ipis,
    #          class_name: "LabelIPI",
    #          foreign_key: "label"

    # has_many :label_isnis,
    #          class_name: "LabelISNI",
    #          foreign_key: "label"

    # has_many :label_meta,
    #          class_name: "LabelMeta",
    #          foreign_key: "id"

    # has_many :label_rating_raws,
    #          class_name: "LabelRatingRaw",
    #          foreign_key: "label"

    # has_many :label_tag_raws,
    #          class_name: "LabelTagRaw",
    #          foreign_key: "label"

    # has_many :label_tags,
    #          class_name: "LabelTag",
    #          foreign_key: "label"

    # has_many :release_labels,
    #          class_name: "ReleaseLabel",
    #          foreign_key: "label"

    attribute :name
    attribute :comment
    attribute :label_code, :integer

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: label
#
#  id               :integer          not null, primary key
#  area             :integer
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
#  label_code       :integer
#  last_updated     :datetime
#  name             :string           not null
#  type             :integer
#
# Indexes
#
#  label_idx_area                 (area)
#  label_idx_gid                  (gid) UNIQUE
#  label_idx_lower_name           (lower((name)::text))
#  label_idx_musicbrainz_collate  (name)
#  label_idx_name                 (name)
#  label_idx_null_comment         (name) UNIQUE WHERE (comment IS NULL)
#  label_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#  label_idx_uniq_name_comment    (name,comment) UNIQUE WHERE (comment IS NOT NULL)
#
# Foreign Keys
#
#  label_fk_area  (area => area.id)
#  label_fk_type  (type => label_type.id)
#
