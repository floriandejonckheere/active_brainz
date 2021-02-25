# frozen_string_literal: true

module ActiveBrainz
  class GenreAlias < Base
    self.table_name = "genre_alias"

    belongs_to :genre_alias_genre,
               class_name: "Genre",
               foreign_key: "genre",
               optional: true

    attribute :name

    attribute :locale
    attribute :primary_for_locale, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: genre_alias
#
#  id                 :integer          not null, primary key
#  edits_pending      :integer          default(0), not null
#  genre              :integer          not null
#  last_updated       :datetime
#  locale             :text
#  name               :string           not null
#  primary_for_locale :boolean          default(FALSE), not null
#
# Indexes
#
#  genre_alias_idx_genre    (genre)
#  genre_alias_idx_primary  (genre,locale) UNIQUE WHERE ((primary_for_locale = true) AND (locale IS NOT NULL))
#
# Foreign Keys
#
#  genre_alias_fk_genre  (genre => genre.id)
#
