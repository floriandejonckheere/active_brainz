# frozen_string_literal: true

module ActiveBrainz
  class ReleaseGroup < Base
    self.table_name = "release_group"

    include HasGID

    belongs_to :release_group_artist_credit,
               class_name: "ArtistCredit",
               foreign_key: "artist_credit",
               optional: true

    # belongs_to :release_group_primary_type,
    #            class_name: "ReleaseGroupPrimaryType",
    #            foreign_key: "type",
    #            optional: true

    # has_many :edit_release_groups,
    #          class_name: "EditReleaseGroup",
    #          foreign_key: "release_group"

    # has_many :editor_collection_release_groups,
    #          class_name: "EditorCollectionReleaseGroup",
    #          foreign_key: "release_group"

    # has_many :release_group_aliases,
    #          class_name: "ReleaseGroupAlias",
    #          foreign_key: "release_group"

    # has_many :release_group_annotations,
    #          class_name: "ReleaseGroupAnnotation",
    #          foreign_key: "release_group"

    # has_many :release_group_attributes,
    #          class_name: "ReleaseGroupAttribute",
    #          foreign_key: "release_group"

    # has_many :release_group_gid_redirects,
    #          class_name: "ReleaseGroupGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :release_group_meta,
    #          class_name: "ReleaseGroupMeta",
    #          foreign_key: "id"

    # has_many :release_group_rating_raws,
    #          class_name: "ReleaseGroupRatingRaw",
    #          foreign_key: "release_group"

    # has_many :release_group_secondary_type_joins,
    #          class_name: "ReleaseGroupSecondaryTypeJoin",
    #          foreign_key: "release_group"

    # has_many :release_group_tag_raws,
    #          class_name: "ReleaseGroupTagRaw",
    #          foreign_key: "release_group"

    # has_many :release_group_tags,
    #          class_name: "ReleaseGroupTag",
    #          foreign_key: "release_group"

    has_many :releases,
             class_name: "Release",
             foreign_key: "release_group"

    attribute :name
    attribute :comment

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: release_group
#
#  id            :integer          not null, primary key
#  artist_credit :integer          not null
#  comment       :string(255)      default(""), not null
#  edits_pending :integer          default(0), not null
#  gid           :uuid             not null
#  last_updated  :datetime
#  name          :string           not null
#  type          :integer
#
# Indexes
#
#  release_group_idx_artist_credit        (artist_credit)
#  release_group_idx_gid                  (gid) UNIQUE
#  release_group_idx_musicbrainz_collate  (name)
#  release_group_idx_name                 (name)
#  release_group_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  release_group_fk_artist_credit  (artist_credit => artist_credit.id)
#  release_group_fk_type           (type => release_group_primary_type.id)
#
