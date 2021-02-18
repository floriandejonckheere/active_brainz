# frozen_string_literal: true

module ActiveBrainz
  class Artist < Base
    self.table_name = "artist"
    self.inheritance_column = nil

    include HasGID

    belongs_to :area,
               class_name: "Area",
               optional: true

    belongs_to :begin_area,
               class_name: "Area",
               optional: true

    belongs_to :end_area,
               class_name: "Area",
               optional: true

    belongs_to :type,
               class_name: "ArtistType",
               optional: true

    belongs_to :gender,
               class_name: "Gender",
               optional: true

    attribute :name
    attribute :sort_name

    attribute :begin_date_year, :integer
    attribute :begin_date_month, :integer
    attribute :begin_date_day, :integer

    attribute :end_date_year, :integer
    attribute :end_date_month, :integer
    attribute :end_date_day, :integer

    attribute :comment
    attribute :edits_pending, :integer
    attribute :last_updated, :datetime

    def begin_date
      @begin_date ||= Date.new(begin_date_year, begin_date_month, begin_date_day)
    end

    def end_date
      @end_date ||= Date.new(end_date_year, end_date_month, end_date_day)
    end
  end
end

# == Schema Information
#
# Table name: artist
#
#  id               :integer          not null, primary key
#  area             :integer
#  begin_area       :integer
#  begin_date_day   :integer
#  begin_date_month :integer
#  begin_date_year  :integer
#  comment          :string(255)      default(""), not null
#  edits_pending    :integer          default(0), not null
#  end_area         :integer
#  end_date_day     :integer
#  end_date_month   :integer
#  end_date_year    :integer
#  ended            :boolean          default(FALSE), not null
#  gender           :integer
#  gid              :uuid             not null
#  last_updated     :datetime
#  name             :string           not null
#  sort_name        :string           not null
#  type             :integer
#
# Indexes
#
#  artist_idx_area                 (area)
#  artist_idx_begin_area           (begin_area)
#  artist_idx_end_area             (end_area)
#  artist_idx_gid                  (gid) UNIQUE
#  artist_idx_lower_name           (lower((name)::text))
#  artist_idx_musicbrainz_collate  (name)
#  artist_idx_name                 (name)
#  artist_idx_null_comment         (name) UNIQUE WHERE (comment IS NULL)
#  artist_idx_sort_name            (sort_name)
#  artist_idx_txt                  (mb_simple_tsvector((name)::text)) USING gin
#  artist_idx_txt_sort             (mb_simple_tsvector((sort_name)::text)) USING gin
#  artist_idx_uniq_name_comment    (name,comment) UNIQUE WHERE (comment IS NOT NULL)
#
# Foreign Keys
#
#  artist_fk_area        (area => area.id)
#  artist_fk_begin_area  (begin_area => area.id)
#  artist_fk_end_area    (end_area => area.id)
#  artist_fk_gender      (gender => gender.id)
#  artist_fk_type        (type => artist_type.id)
#
