# frozen_string_literal: true

module ActiveBrainz
  class ArtistCredit < Base
    self.table_name = "artist_credit"

    # has_many :alternative_releases,
    #          class_name: "AlternativeRelease",
    #          foreign_key: "artist_credit"

    # has_many :alternative_tracks,
    #          class_name: "AlternativeTrack",
    #          foreign_key: "artist_credit"

    has_many :artist_credit_names,
             class_name: "ArtistCreditName",
             foreign_key: "artist_credit"

    # has_many :recordings,
    #          class_name: "Recording",
    #          foreign_key: "artist_credit"

    # has_many :release_groups,
    #          class_name: "ReleaseGroup",
    #          foreign_key: "artist_credit"

    # has_many :releases,
    #          class_name: "Release",
    #          foreign_key: "artist_credit"

    # has_many :tracks,
    #          class_name: "Track",
    #          foreign_key: "artist_credit"

    attribute :name

    attribute :edits_pending, :integer
    attribute :artist_count, :integer
    attribute :ref_count, :integer

    attribute :created, :datetime
  end
end

# == Schema Information
#
# Table name: artist_credit
#
#  id            :integer          not null, primary key
#  artist_count  :integer          not null
#  created       :datetime
#  edits_pending :integer          default(0), not null
#  name          :string           not null
#  ref_count     :integer          default(0)
#
# Indexes
#
#  artist_credit_idx_musicbrainz_collate  (name)
#  artist_credit_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#
