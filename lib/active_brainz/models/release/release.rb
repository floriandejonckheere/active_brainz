# frozen_string_literal: true

module ActiveBrainz
  class Release < Base
    self.table_name = "release"

    include HasGID

    belongs_to :release_artist_credit,
               class_name: "ArtistCredit",
               foreign_key: "artist_credit",
               optional: true

    # belongs_to :release_language,
    #            class_name: "Language",
    #            foreign_key: "language",
    #            optional: true

    # belongs_to :release_packaging,
    #            class_name: "ReleasePackaging",
    #            foreign_key: "packaging",
    #            optional: true

    belongs_to :release_release_group,
               class_name: "ReleaseGroup",
               foreign_key: "release_group",
               optional: true

    # belongs_to :release_script,
    #            class_name: "Script",
    #            foreign_key: "script",
    #            optional: true

    # belongs_to :release_status,
    #            class_name: "ReleaseStatus",
    #            foreign_key: "status",
    #            optional: true

    # has_many :alternative_releases,
    #          class_name: "AlternativeRelease",
    #          foreign_key: "release"

    # has_many :edit_releases,
    #          class_name: "EditRelease",
    #          foreign_key: "release"

    # has_many :editor_collection_releases,
    #          class_name: "EditorCollectionRelease",
    #          foreign_key: "release"

    has_many :media,
             class_name: "Medium",
             foreign_key: "release"

    # has_many :release_aliases,
    #          class_name: "ReleaseAlias",
    #          foreign_key: "release"

    # has_many :release_annotations,
    #          class_name: "ReleaseAnnotation",
    #          foreign_key: "release"

    # has_many :release_attributes,
    #          class_name: "ReleaseAttribute",
    #          foreign_key: "release"

    # has_many :release_countries,
    #          class_name: "ReleaseCountry",
    #          foreign_key: "release"

    # has_many :release_coverarts,
    #          class_name: "ReleaseCoverart",
    #          foreign_key: "id"

    # has_many :release_first_release_dates,
    #          class_name: "ReleaseFirstReleaseDate",
    #          foreign_key: "release"

    # has_many :release_gid_redirects,
    #          class_name: "ReleaseGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :release_labels,
    #          class_name: "ReleaseLabel",
    #          foreign_key: "release"

    # has_many :release_meta,
    #          class_name: "ReleaseMeta",
    #          foreign_key: "id"

    # has_many :release_tag_raws,
    #          class_name: "ReleaseTagRaw",
    #          foreign_key: "release"

    # has_many :release_tags,
    #          class_name: "ReleaseTag",
    #          foreign_key: "release"

    # has_many :release_unknown_countries,
    #          class_name: "ReleaseUnknownCountry",
    #          foreign_key: "release"

    attribute :name
    attribute :comment

    attribute :barcode

    attribute :quality, :integer
    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: release
#
#  id            :integer          not null, primary key
#  artist_credit :integer          not null
#  barcode       :string(255)
#  comment       :string(255)      default(""), not null
#  edits_pending :integer          default(0), not null
#  gid           :uuid             not null
#  language      :integer
#  last_updated  :datetime
#  name          :string           not null
#  packaging     :integer
#  quality       :integer          default(-1), not null
#  release_group :integer          not null
#  script        :integer
#  status        :integer
#
# Indexes
#
#  release_idx_artist_credit        (artist_credit)
#  release_idx_gid                  (gid) UNIQUE
#  release_idx_musicbrainz_collate  (name)
#  release_idx_name                 (name)
#  release_idx_release_group        (release_group)
#  release_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  release_fk_artist_credit  (artist_credit => artist_credit.id)
#  release_fk_language       (language => language.id)
#  release_fk_packaging      (packaging => release_packaging.id)
#  release_fk_release_group  (release_group => release_group.id)
#  release_fk_script         (script => script.id)
#  release_fk_status         (status => release_status.id)
#
