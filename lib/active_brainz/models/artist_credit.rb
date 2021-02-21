# frozen_string_literal: true

module ActiveBrainz
  class ArtistCredit < Base
    self.table_name = "artist_credit"

    attribute :name

    attribute :artist_count, :integer
    attribute :created, :datetime
    attribute :edits_pending, :integer
    attribute :ref_count, :integer
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
