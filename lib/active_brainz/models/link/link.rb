# frozen_string_literal: true

module ActiveBrainz
  class Link < Base
    self.table_name = "link"

    include HasBeginEndDate

    # has_many :area_areas,
    #          class_name: "LAreaArea",
    #          foreign_key: "link"

    # has_many :area_artists,
    #          class_name: "LAreaArtist",
    #          foreign_key: "link"

    # has_many :area_events,
    #          class_name: "LAreaEvent",
    #          foreign_key: "link"

    # has_many :area_instruments,
    #          class_name: "LAreaInstrument",
    #          foreign_key: "link"

    # has_many :area_labels,
    #          class_name: "LAreaLabel",
    #          foreign_key: "link"

    # has_many :area_places,
    #          class_name: "LAreaPlace",
    #          foreign_key: "link"

    # has_many :area_recordings,
    #          class_name: "LAreaRecording",
    #          foreign_key: "link"

    # has_many :area_release_groups,
    #          class_name: "LAreaReleaseGroup",
    #          foreign_key: "link"

    # has_many :area_releases,
    #          class_name: "LAreaRelease",
    #          foreign_key: "link"

    # has_many :area_series,
    #          class_name: "LAreaSeries",
    #          foreign_key: "link"

    # has_many :area_urls,
    #          class_name: "LAreaUrl",
    #          foreign_key: "link"

    # has_many :area_works,
    #          class_name: "LAreaWork",
    #          foreign_key: "link"

    # has_many :artist_artists,
    #          class_name: "LArtistArtist",
    #          foreign_key: "link"

    # has_many :artist_events,
    #          class_name: "LArtistEvent",
    #          foreign_key: "link"

    # has_many :artist_instruments,
    #          class_name: "LArtistInstrument",
    #          foreign_key: "link"

    # has_many :artist_labels,
    #          class_name: "LArtistLabel",
    #          foreign_key: "link"

    # has_many :artist_places,
    #          class_name: "LArtistPlace",
    #          foreign_key: "link"

    # has_many :artist_recordings,
    #          class_name: "LArtistRecording",
    #          foreign_key: "link"

    # has_many :artist_release_groups,
    #          class_name: "LArtistReleaseGroup",
    #          foreign_key: "link"

    # has_many :artist_releases,
    #          class_name: "LArtistRelease",
    #          foreign_key: "link"

    # has_many :artist_series,
    #          class_name: "LArtistSeries",
    #          foreign_key: "link"

    # has_many :artist_urls,
    #          class_name: "LArtistUrl",
    #          foreign_key: "link"

    # has_many :artist_works,
    #          class_name: "LArtistWork",
    #          foreign_key: "link"

    # has_many :event_events,
    #          class_name: "LEventEvent",
    #          foreign_key: "link"

    # has_many :event_instruments,
    #          class_name: "LEventInstrument",
    #          foreign_key: "link"

    # has_many :event_labels,
    #          class_name: "LEventLabel",
    #          foreign_key: "link"

    # has_many :event_places,
    #          class_name: "LEventPlace",
    #          foreign_key: "link"

    # has_many :event_recordings,
    #          class_name: "LEventRecording",
    #          foreign_key: "link"

    # has_many :event_release_groups,
    #          class_name: "LEventReleaseGroup",
    #          foreign_key: "link"

    # has_many :event_releases,
    #          class_name: "LEventRelease",
    #          foreign_key: "link"

    # has_many :event_series,
    #          class_name: "LEventSeries",
    #          foreign_key: "link"

    # has_many :event_urls,
    #          class_name: "LEventUrl",
    #          foreign_key: "link"

    # has_many :event_works,
    #          class_name: "LEventWork",
    #          foreign_key: "link"

    # has_many :instrument_instruments,
    #          class_name: "LInstrumentInstrument",
    #          foreign_key: "link"

    # has_many :instrument_labels,
    #          class_name: "LInstrumentLabel",
    #          foreign_key: "link"

    # has_many :instrument_places,
    #          class_name: "LInstrumentPlace",
    #          foreign_key: "link"

    # has_many :instrument_recordings,
    #          class_name: "LInstrumentRecording",
    #          foreign_key: "link"

    # has_many :instrument_release_groups,
    #          class_name: "LInstrumentReleaseGroup",
    #          foreign_key: "link"

    # has_many :instrument_releases,
    #          class_name: "LInstrumentRelease",
    #          foreign_key: "link"

    # has_many :instrument_series,
    #          class_name: "LInstrumentSeries",
    #          foreign_key: "link"

    # has_many :instrument_urls,
    #          class_name: "LInstrumentUrl",
    #          foreign_key: "link"

    # has_many :instrument_works,
    #          class_name: "LInstrumentWork",
    #          foreign_key: "link"

    # has_many :label_labels,
    #          class_name: "LLabelLabel",
    #          foreign_key: "link"

    # has_many :label_places,
    #          class_name: "LLabelPlace",
    #          foreign_key: "link"

    # has_many :label_recordings,
    #          class_name: "LLabelRecording",
    #          foreign_key: "link"

    # has_many :label_release_groups,
    #          class_name: "LLabelReleaseGroup",
    #          foreign_key: "link"

    # has_many :label_releases,
    #          class_name: "LLabelRelease",
    #          foreign_key: "link"

    # has_many :label_series,
    #          class_name: "LLabelSeries",
    #          foreign_key: "link"

    # has_many :label_urls,
    #          class_name: "LLabelUrl",
    #          foreign_key: "link"

    # has_many :label_works,
    #          class_name: "LLabelWork",
    #          foreign_key: "link"

    # has_many :place_places,
    #          class_name: "LPlacePlace",
    #          foreign_key: "link"

    # has_many :place_recordings,
    #          class_name: "LPlaceRecording",
    #          foreign_key: "link"

    # has_many :place_release_groups,
    #          class_name: "LPlaceReleaseGroup",
    #          foreign_key: "link"

    # has_many :place_releases,
    #          class_name: "LPlaceRelease",
    #          foreign_key: "link"

    # has_many :place_series,
    #          class_name: "LPlaceSeries",
    #          foreign_key: "link"

    # has_many :place_urls,
    #          class_name: "LPlaceUrl",
    #          foreign_key: "link"

    # has_many :place_works,
    #          class_name: "LPlaceWork",
    #          foreign_key: "link"

    # has_many :recording_recordings,
    #          class_name: "LRecordingRecording",
    #          foreign_key: "link"

    # has_many :recording_release_groups,
    #          class_name: "LRecordingReleaseGroup",
    #          foreign_key: "link"

    # has_many :recording_releases,
    #          class_name: "LRecordingRelease",
    #          foreign_key: "link"

    # has_many :recording_series,
    #          class_name: "LRecordingSeries",
    #          foreign_key: "link"

    # has_many :recording_urls,
    #          class_name: "LRecordingUrl",
    #          foreign_key: "link"

    # has_many :recording_works,
    #          class_name: "LRecordingWork",
    #          foreign_key: "link"

    # has_many :release_group_release_groups,
    #          class_name: "LReleaseGroupReleaseGroup",
    #          foreign_key: "link"

    # has_many :release_group_series,
    #          class_name: "LReleaseGroupSeries",
    #          foreign_key: "link"

    # has_many :release_group_urls,
    #          class_name: "LReleaseGroupUrl",
    #          foreign_key: "link"

    # has_many :release_group_works,
    #          class_name: "LReleaseGroupWork",
    #          foreign_key: "link"

    # has_many :release_release_groups,
    #          class_name: "LReleaseReleaseGroup",
    #          foreign_key: "link"

    # has_many :release_releases,
    #          class_name: "LReleaseRelease",
    #          foreign_key: "link"

    # has_many :release_series,
    #          class_name: "LReleaseSeries",
    #          foreign_key: "link"

    # has_many :release_urls,
    #          class_name: "LReleaseUrl",
    #          foreign_key: "link"

    # has_many :release_works,
    #          class_name: "LReleaseWork",
    #          foreign_key: "link"

    # has_many :series_series,
    #          class_name: "LSeriesSeries",
    #          foreign_key: "link"

    # has_many :series_urls,
    #          class_name: "LSeriesUrl",
    #          foreign_key: "link"

    # has_many :series_works,
    #          class_name: "LSeriesWork",
    #          foreign_key: "link"

    # has_many :url_urls,
    #          class_name: "LUrlUrl",
    #          foreign_key: "link"

    # has_many :url_works,
    #          class_name: "LUrlWork",
    #          foreign_key: "link"

    # has_many :work_works,
    #          class_name: "LWorkWork",
    #          foreign_key: "link"

    # has_many :link_attribute_credits,
    #          class_name: "LinkAttributeCredit",
    #          foreign_key: "link"

    # has_many :link_attribute_text_values,
    #          class_name: "LinkAttributeTextValue",
    #          foreign_key: "link"

    # has_many :link_attributes,
    #          class_name: "LinkAttribute",
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
