# frozen_string_literal: true

module ActiveBrainz
  class PlaceAlias < Base
    self.table_name = "place_alias"

    include HasBeginEndDate

    belongs_to :place_alias_place,
               class_name: "Place",
               foreign_key: "place",
               optional: true

    belongs_to :place_alias_type,
               class_name: "PlaceAliasType",
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
# Table name: place_alias
#
#  id                 :integer          not null, primary key
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
#  place              :integer          not null
#  primary_for_locale :boolean          default(FALSE), not null
#  sort_name          :string           not null
#  type               :integer
#
# Indexes
#
#  place_alias_idx_place     (place)
#  place_alias_idx_primary   (place,locale) UNIQUE WHERE ((primary_for_locale = true) AND (locale IS NOT NULL))
#  place_alias_idx_txt       (mb_simple_tsvector((name)::text)) USING gin
#  place_alias_idx_txt_sort  (mb_simple_tsvector((sort_name)::text)) USING gin
#
# Foreign Keys
#
#  place_alias_fk_place  (place => place.id)
#  place_alias_fk_type   (type => place_alias_type.id)
#
