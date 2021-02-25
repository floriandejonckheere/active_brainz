# frozen_string_literal: true

module ActiveBrainz
  class ArtistCreditName < Base
    self.table_name = "artist_credit_name"
    self.primary_key = %w(artist_credit position)

    belongs_to :artist_credit_name_artist,
               class_name: "Artist",
               foreign_key: "artist",
               optional: true

    belongs_to :artist_credit_name_artist_credit,
               class_name: "ArtistCredit",
               foreign_key: "artist_credit",
               optional: true

    attribute :name

    attribute :position, :integer

    attribute :join_phrase
  end
end

# == Schema Information
#
# Table name: artist_credit_name
#
#  artist        :integer          not null
#  artist_credit :integer          not null
#  join_phrase   :text             default(""), not null
#  name          :string           not null
#  position      :integer          not null
#
# Indexes
#
#  artist_credit_name_idx_artist               (artist)
#  artist_credit_name_idx_musicbrainz_collate  (name)
#  artist_credit_name_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#
# Foreign Keys
#
#  artist_credit_name_fk_artist         (artist => artist.id) ON DELETE => cascade
#  artist_credit_name_fk_artist_credit  (artist_credit => artist_credit.id) ON DELETE => cascade
#
