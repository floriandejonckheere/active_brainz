# frozen_string_literal: true

module ActiveBrainz
  class Medium < Base
    self.table_name = "medium"

    # belongs_to :medium_format,
    #            class_name: "MediumFormat",
    #            foreign_key: "format",
    #            optional: true

    belongs_to :medium_release,
               class_name: "Release",
               foreign_key: "release",
               optional: true

    # has_many :alternative_media,
    #          class_name: "AlternativeMedium",
    #          foreign_key: "medium"

    # has_many :medium_attributes,
    #          class_name: "MediumAttribute",
    #          foreign_key: "medium"

    # has_many :medium_cdtocs,
    #          class_name: "MediumCdtoc",
    #          foreign_key: "medium"

    # has_many :medium_indices,
    #          class_name: "MediumIndex",
    #          foreign_key: "medium"

    has_many :tracks,
             class_name: "Track",
             foreign_key: "medium"

    attribute :name
    attribute :position, :integer
    attribute :track_count, :integer

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: medium
#
#  id            :integer          not null, primary key
#  edits_pending :integer          default(0), not null
#  format        :integer
#  last_updated  :datetime
#  name          :string           default(""), not null
#  position      :integer          not null
#  release       :integer          not null
#  track_count   :integer          default(0), not null
#
# Indexes
#
#  medium_idx_release_position  (release,position)
#  medium_idx_track_count       (track_count)
#
# Foreign Keys
#
#  medium_fk_format   (format => medium_format.id)
#  medium_fk_release  (release => release.id)
#
