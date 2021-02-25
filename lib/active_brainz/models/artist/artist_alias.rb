# frozen_string_literal: true

module ActiveBrainz
  class ArtistAlias < Base
    self.table_name = "artist_alias"

    include HasBeginEndDate

    belongs_to :artist_alias_artist,
               class_name: "Artist",
               foreign_key: "artist",
               optional: true

    belongs_to :artist_alias_type,
               class_name: "ArtistAliasType",
               foreign_key: "type",
               optional: true

    attribute :name
    attribute :sort_name

    attribute :locale
    attribute :primary_for_locale, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: artist_alias
#
#  id                 :integer          not null, primary key
#  artist             :integer          not null
#  begin_date_day     :integer
#  begin_date_month   :integer
#  begin_date_year    :integer
#  edits_pending      :integer          default(0), not null
#  end_date_day       :integer
#  end_date_month     :integer
#  end_date_year      :integer
#  ended              :boolean          default(FALSE), not null
#  last_updated       :datetime
#  locale             :text
#  name               :string           not null
#  primary_for_locale :boolean          default(FALSE), not null
#  sort_name          :string           not null
#  type               :integer
#
# Indexes
#
#  artist_alias_idx_artist    (artist)
#  artist_alias_idx_primary   (artist,locale) UNIQUE WHERE ((primary_for_locale = true) AND (locale IS NOT NULL))
#  artist_alias_idx_txt       (mb_simple_tsvector((name)::text)) USING gin
#  artist_alias_idx_txt_sort  (mb_simple_tsvector((sort_name)::text)) USING gin
#
# Foreign Keys
#
#  artist_alias_fk_artist  (artist => artist.id)
#  artist_alias_fk_type    (type => artist_alias_type.id)
#
