# frozen_string_literal: true

module ActiveBrainz
  class Recording < Base
    self.table_name = "recording"

    include HasGID

    belongs_to :recording_artist_credit,
               class_name: "ArtistCredit",
               foreign_key: "artist_credit",
               optional: true

    # has_many :edit_recordings,
    #          class_name: "EditRecording",
    #          foreign_key: "recording"

    # has_many :editor_collection_recordings,
    #          class_name: "EditorCollectionRecording",
    #          foreign_key: "recording"

    # has_many :isrcs,
    #          class_name: "Isrc",
    #          foreign_key: "recording"

    # has_many :recording_aliases,
    #          class_name: "RecordingAlias",
    #          foreign_key: "recording"

    # has_many :recording_annotations,
    #          class_name: "RecordingAnnotation",
    #          foreign_key: "recording"

    # has_many :recording_attributes,
    #          class_name: "RecordingAttribute",
    #          foreign_key: "recording"

    # has_many :recording_first_release_dates,
    #          class_name: "RecordingFirstReleaseDate",
    #          foreign_key: "recording"

    # has_many :recording_gid_redirects,
    #          class_name: "RecordingGIDRedirect",
    #          foreign_key: "new_id"

    # has_many :recording_meta,
    #          class_name: "RecordingMeta",
    #          foreign_key: "id"

    # has_many :recording_rating_raws,
    #          class_name: "RecordingRatingRaw",
    #          foreign_key: "recording"

    # has_many :recording_tag_raws,
    #          class_name: "RecordingTagRaw",
    #          foreign_key: "recording"

    # has_many :recording_tags,
    #          class_name: "RecordingTag",
    #          foreign_key: "recording"

    has_many :tracks,
             class_name: "Track",
             foreign_key: "recording"

    attribute :name
    attribute :comment
    attribute :length, :integer
    attribute :video, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: recording
#
#  id            :integer          not null, primary key
#  artist_credit :integer          not null
#  comment       :string(255)      default(""), not null
#  edits_pending :integer          default(0), not null
#  gid           :uuid             not null
#  last_updated  :datetime
#  length        :integer
#  name          :string           not null
#  video         :boolean          default(FALSE), not null
#
# Indexes
#
#  recording_idx_artist_credit        (artist_credit)
#  recording_idx_gid                  (gid) UNIQUE
#  recording_idx_musicbrainz_collate  (name)
#  recording_idx_name                 (name)
#  recording_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  recording_fk_artist_credit  (artist_credit => artist_credit.id)
#
