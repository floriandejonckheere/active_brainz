# frozen_string_literal: true

module ActiveBrainz
  class Track < Base
    self.table_name = "track"

    include HasGID

    belongs_to :track_artist_credit,
               class_name: "ArtistCredit",
               foreign_key: "artist_credit",
               optional: true

    # belongs_to :track_medium,
    #            class_name: "Medium",
    #            foreign_key: "medium",
    #            optional: true

    belongs_to :track_recording,
               class_name: "Recording",
               foreign_key: "recording",
               optional: true

    # has_many :alternative_medium_tracks,
    #          class_name: "AlternativeMediumTrack",
    #          foreign_key: "track"

    # has_many :track_gid_redirects,
    #          class_name: "TrackGIDRedirect",
    #          foreign_key: "new_id"

    attribute :name
    attribute :number
    attribute :length, :integer
    attribute :position, :integer
    attribute :is_data_track, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: track
#
#  id            :integer          not null, primary key
#  artist_credit :integer          not null
#  edits_pending :integer          default(0), not null
#  gid           :uuid             not null
#  is_data_track :boolean          default(FALSE), not null
#  last_updated  :datetime
#  length        :integer
#  medium        :integer          not null
#  name          :string           not null
#  number        :text             not null
#  position      :integer          not null
#  recording     :integer          not null
#
# Indexes
#
#  track_idx_artist_credit    (artist_credit)
#  track_idx_gid              (gid) UNIQUE
#  track_idx_medium_position  (medium,position)
#  track_idx_recording        (recording)
#
# Foreign Keys
#
#  track_fk_artist_credit  (artist_credit => artist_credit.id)
#  track_fk_medium         (medium => medium.id)
#  track_fk_recording      (recording => recording.id)
#
