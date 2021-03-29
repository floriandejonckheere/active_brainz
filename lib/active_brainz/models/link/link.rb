# frozen_string_literal: true

module ActiveBrainz
  class Link < Base
    self.table_name = "link"

    include HasBeginEndDate

    has_many :area_areas,
             class_name: "AreaArea",
             foreign_key: "link"

    # has_many :area_artists,
    #          class_name: "AreaArtist",
    #          foreign_key: "link"

    # has_many :area_events,
    #          class_name: "AreaEvent",
    #          foreign_key: "link"

    # has_many :area_instruments,
    #          class_name: "AreaInstrument",
    #          foreign_key: "link"

    # has_many :area_labels,
    #          class_name: "AreaLabel",
    #          foreign_key: "link"

    # has_many :area_places,
    #          class_name: "AreaPlace",
    #          foreign_key: "link"

    # has_many :area_recordings,
    #          class_name: "AreaRecording",
    #          foreign_key: "link"

    # has_many :area_release_groups,
    #          class_name: "AreaReleaseGroup",
    #          foreign_key: "link"

    # has_many :area_releases,
    #          class_name: "AreaRelease",
    #          foreign_key: "link"

    # has_many :area_series,
    #          class_name: "AreaSeries",
    #          foreign_key: "link"

    # has_many :area_urls,
    #          class_name: "AreaUrl",
    #          foreign_key: "link"

    # has_many :area_works,
    #          class_name: "AreaWork",
    #          foreign_key: "link"

    # has_many :artist_artists,
    #          class_name: "ArtistArtist",
    #          foreign_key: "link"

    # has_many :artist_events,
    #          class_name: "ArtistEvent",
    #          foreign_key: "link"

    # has_many :artist_instruments,
    #          class_name: "ArtistInstrument",
    #          foreign_key: "link"

    # has_many :artist_labels,
    #          class_name: "ArtistLabel",
    #          foreign_key: "link"

    # has_many :artist_places,
    #          class_name: "ArtistPlace",
    #          foreign_key: "link"

    # has_many :artist_recordings,
    #          class_name: "ArtistRecording",
    #          foreign_key: "link"

    # has_many :artist_release_groups,
    #          class_name: "ArtistReleaseGroup",
    #          foreign_key: "link"

    # has_many :artist_releases,
    #          class_name: "ArtistRelease",
    #          foreign_key: "link"

    # has_many :artist_series,
    #          class_name: "ArtistSeries",
    #          foreign_key: "link"

    # has_many :artist_urls,
    #          class_name: "ArtistUrl",
    #          foreign_key: "link"

    # has_many :artist_works,
    #          class_name: "ArtistWork",
    #          foreign_key: "link"

    # has_many :event_events,
    #          class_name: "EventEvent",
    #          foreign_key: "link"

    # has_many :event_instruments,
    #          class_name: "EventInstrument",
    #          foreign_key: "link"

    # has_many :event_labels,
    #          class_name: "EventLabel",
    #          foreign_key: "link"

    # has_many :event_places,
    #          class_name: "EventPlace",
    #          foreign_key: "link"

    # has_many :event_recordings,
    #          class_name: "EventRecording",
    #          foreign_key: "link"

    # has_many :event_release_groups,
    #          class_name: "EventReleaseGroup",
    #          foreign_key: "link"

    # has_many :event_releases,
    #          class_name: "EventRelease",
    #          foreign_key: "link"

    # has_many :event_series,
    #          class_name: "EventSeries",
    #          foreign_key: "link"

    # has_many :event_urls,
    #          class_name: "EventUrl",
    #          foreign_key: "link"

    # has_many :event_works,
    #          class_name: "EventWork",
    #          foreign_key: "link"

    # has_many :instrument_instruments,
    #          class_name: "InstrumentInstrument",
    #          foreign_key: "link"

    # has_many :instrument_labels,
    #          class_name: "InstrumentLabel",
    #          foreign_key: "link"

    # has_many :instrument_places,
    #          class_name: "InstrumentPlace",
    #          foreign_key: "link"

    # has_many :instrument_recordings,
    #          class_name: "InstrumentRecording",
    #          foreign_key: "link"

    # has_many :instrument_release_groups,
    #          class_name: "InstrumentReleaseGroup",
    #          foreign_key: "link"

    # has_many :instrument_releases,
    #          class_name: "InstrumentRelease",
    #          foreign_key: "link"

    # has_many :instrument_series,
    #          class_name: "InstrumentSeries",
    #          foreign_key: "link"

    # has_many :instrument_urls,
    #          class_name: "InstrumentUrl",
    #          foreign_key: "link"

    # has_many :instrument_works,
    #          class_name: "InstrumentWork",
    #          foreign_key: "link"

    # has_many :label_labels,
    #          class_name: "LabelLabel",
    #          foreign_key: "link"

    # has_many :label_places,
    #          class_name: "LabelPlace",
    #          foreign_key: "link"

    # has_many :label_recordings,
    #          class_name: "LabelRecording",
    #          foreign_key: "link"

    # has_many :label_release_groups,
    #          class_name: "LabelReleaseGroup",
    #          foreign_key: "link"

    # has_many :label_releases,
    #          class_name: "LabelRelease",
    #          foreign_key: "link"

    # has_many :label_series,
    #          class_name: "LabelSeries",
    #          foreign_key: "link"

    # has_many :label_urls,
    #          class_name: "LabelUrl",
    #          foreign_key: "link"

    # has_many :label_works,
    #          class_name: "LabelWork",
    #          foreign_key: "link"

    # has_many :place_places,
    #          class_name: "PlacePlace",
    #          foreign_key: "link"

    # has_many :place_recordings,
    #          class_name: "PlaceRecording",
    #          foreign_key: "link"

    # has_many :place_release_groups,
    #          class_name: "PlaceReleaseGroup",
    #          foreign_key: "link"

    # has_many :place_releases,
    #          class_name: "PlaceRelease",
    #          foreign_key: "link"

    # has_many :place_series,
    #          class_name: "PlaceSeries",
    #          foreign_key: "link"

    # has_many :place_urls,
    #          class_name: "PlaceUrl",
    #          foreign_key: "link"

    # has_many :place_works,
    #          class_name: "PlaceWork",
    #          foreign_key: "link"

    # has_many :recording_recordings,
    #          class_name: "RecordingRecording",
    #          foreign_key: "link"

    # has_many :recording_release_groups,
    #          class_name: "RecordingReleaseGroup",
    #          foreign_key: "link"

    # has_many :recording_releases,
    #          class_name: "RecordingRelease",
    #          foreign_key: "link"

    # has_many :recording_series,
    #          class_name: "RecordingSeries",
    #          foreign_key: "link"

    # has_many :recording_urls,
    #          class_name: "RecordingUrl",
    #          foreign_key: "link"

    # has_many :recording_works,
    #          class_name: "RecordingWork",
    #          foreign_key: "link"

    # has_many :release_group_release_groups,
    #          class_name: "ReleaseGroupReleaseGroup",
    #          foreign_key: "link"

    # has_many :release_group_series,
    #          class_name: "ReleaseGroupSeries",
    #          foreign_key: "link"

    # has_many :release_group_urls,
    #          class_name: "ReleaseGroupUrl",
    #          foreign_key: "link"

    # has_many :release_group_works,
    #          class_name: "ReleaseGroupWork",
    #          foreign_key: "link"

    # has_many :release_release_groups,
    #          class_name: "ReleaseReleaseGroup",
    #          foreign_key: "link"

    # has_many :release_releases,
    #          class_name: "ReleaseRelease",
    #          foreign_key: "link"

    # has_many :release_series,
    #          class_name: "ReleaseSeries",
    #          foreign_key: "link"

    # has_many :release_urls,
    #          class_name: "ReleaseUrl",
    #          foreign_key: "link"

    # has_many :release_works,
    #          class_name: "ReleaseWork",
    #          foreign_key: "link"

    # has_many :series_series,
    #          class_name: "SeriesSeries",
    #          foreign_key: "link"

    # has_many :series_urls,
    #          class_name: "SeriesUrl",
    #          foreign_key: "link"

    # has_many :series_works,
    #          class_name: "SeriesWork",
    #          foreign_key: "link"

    # has_many :url_urls,
    #          class_name: "UrlUrl",
    #          foreign_key: "link"

    # has_many :url_works,
    #          class_name: "UrlWork",
    #          foreign_key: "link"

    # has_many :work_works,
    #          class_name: "WorkWork",
    #          foreign_key: "link"

    # has_many :link_attribute_credits,
    #          class_name: "inkAttributeCredit",
    #          foreign_key: "link"

    # has_many :link_attribute_text_values,
    #          class_name: "inkAttributeTextValue",
    #          foreign_key: "link"

    # has_many :link_attributes,
    #          class_name: "inkAttribute",
    #          foreign_key: "link"

    belongs_to :link_link_type,
               class_name: "LinkType",
               foreign_key: "link_type",
               optional: true

    attribute :created, :datetime
    attribute :attribute_count, :integer
  end
end

# == Schema Information
#
# Table name: link
#
#  id               :integer          not null, primary key
#  attribute_count  :integer          default(0), not null
#  begin_date_day   :integer
#  begin_date_month :integer
#  begin_date_year  :integer
#  created          :datetime
#  end_date_day     :integer
#  end_date_month   :integer
#  end_date_year    :integer
#  ended            :boolean          default(FALSE), not null
#  link_type        :integer          not null
#
# Indexes
#
#  link_idx_type_attr  (link_type,attribute_count)
#
# Foreign Keys
#
#  link_fk_link_type  (link_type => link_type.id)
#
