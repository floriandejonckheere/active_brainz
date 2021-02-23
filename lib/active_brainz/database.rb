# frozen_string_literal: true

require "singleton"
require "yaml"

require "active_support/core_ext/module/delegation"

module ActiveBrainz
  class Database
    include Singleton

    # Processed tables
    TABLES = [
      # "alternative_release",
      # "alternative_release_type",
      # "alternative_medium",
      # "alternative_track",
      # "alternative_medium_track",
      # "annotation",
      # "application",
      "area_type",
      "area",
      # "area_gid_redirect",
      # "area_alias_type",
      # "area_alias",
      # "area_annotation",
      # "area_attribute_type",
      # "area_attribute_type_allowed_value",
      # "area_attribute",
      # "area_tag",
      # "area_tag_raw",
      "artist",
      "artist_alias_type",
      "artist_alias",
      # "artist_annotation",
      # "artist_attribute_type",
      # "artist_attribute_type_allowed_value",
      # "artist_attribute",
      # "artist_ipi",
      # "artist_isni",
      # "artist_meta",
      # "artist_tag",
      # "artist_rating_raw",
      # "artist_tag_raw",
      "artist_credit",
      "artist_credit_name",
      # "artist_gid_redirect",
      "artist_type",
      # "autoeditor_election",
      # "autoeditor_election_vote",
      # "cdtoc",
      # "cdtoc_raw",
      # "country_area",
      # "deleted_entity",
      # "edit",
      # "edit_data",
      # "edit_note",
      # "edit_note_recipient",
      # "edit_area",
      # "edit_artist",
      # "edit_event",
      # "edit_instrument",
      # "edit_label",
      # "edit_place",
      # "edit_release",
      # "edit_release_group",
      # "edit_recording",
      # "edit_series",
      # "edit_work",
      # "edit_url",
      # "editor",
      # "old_editor_name",
      # "editor_language",
      # "editor_preference",
      # "editor_subscribe_artist",
      # "editor_subscribe_artist_deleted",
      # "editor_subscribe_collection",
      # "editor_subscribe_label",
      # "editor_subscribe_label_deleted",
      # "editor_subscribe_editor",
      # "editor_subscribe_series",
      # "editor_subscribe_series_deleted",
      # "event",
      # "event_meta",
      # "event_rating_raw",
      # "event_tag_raw",
      # "event_alias_type",
      # "event_alias",
      # "event_annotation",
      # "event_attribute_type",
      # "event_attribute_type_allowed_value",
      # "event_attribute",
      # "event_gid_redirect",
      # "event_tag",
      # "event_type",
      # "release_first_release_date",
      # "recording_first_release_date",
      "gender",
      # "genre",
      # "genre_alias",
      # "instrument_type",
      # "instrument",
      # "instrument_gid_redirect",
      # "instrument_alias_type",
      # "instrument_alias",
      # "instrument_annotation",
      # "instrument_attribute_type",
      # "instrument_attribute_type_allowed_value",
      # "instrument_attribute",
      # "instrument_tag",
      # "instrument_tag_raw",
      # "iso_3166_1",
      # "iso_3166_2",
      # "iso_3166_3",
      # "isrc",
      # "iswc",
      # "l_area_area",
      # "l_area_artist",
      # "l_area_event",
      # "l_area_instrument",
      # "l_area_label",
      # "l_area_place",
      # "l_area_recording",
      # "l_area_release",
      # "l_area_release_group",
      # "l_area_series",
      # "l_area_url",
      # "l_area_work",
      # "l_artist_artist",
      # "l_artist_event",
      # "l_artist_instrument",
      # "l_artist_label",
      # "l_artist_place",
      # "l_artist_recording",
      # "l_artist_release",
      # "l_artist_release_group",
      # "l_artist_series",
      # "l_artist_url",
      # "l_artist_work",
      # "l_event_event",
      # "l_event_instrument",
      # "l_event_label",
      # "l_event_place",
      # "l_event_recording",
      # "l_event_release",
      # "l_event_release_group",
      # "l_event_series",
      # "l_event_url",
      # "l_event_work",
      # "l_label_label",
      # "l_instrument_instrument",
      # "l_instrument_label",
      # "l_instrument_place",
      # "l_instrument_recording",
      # "l_instrument_release",
      # "l_instrument_release_group",
      # "l_instrument_series",
      # "l_instrument_url",
      # "l_instrument_work",
      # "l_label_place",
      # "l_label_recording",
      # "l_label_release",
      # "l_label_release_group",
      # "l_label_series",
      # "l_label_url",
      # "l_label_work",
      # "l_place_place",
      # "l_place_recording",
      # "l_place_release",
      # "l_place_release_group",
      # "l_place_series",
      # "l_place_url",
      # "l_place_work",
      # "l_recording_recording",
      # "l_recording_release",
      # "l_recording_release_group",
      # "l_recording_series",
      # "l_recording_url",
      # "l_recording_work",
      # "l_release_release",
      # "l_release_release_group",
      # "l_release_series",
      # "l_release_url",
      # "l_release_work",
      # "l_release_group_release_group",
      # "l_release_group_series",
      # "l_release_group_url",
      # "l_release_group_work",
      # "l_series_series",
      # "l_series_url",
      # "l_series_work",
      # "l_url_url",
      # "l_url_work",
      # "l_work_work",
      # "label",
      # "label_rating_raw",
      # "label_tag_raw",
      # "label_alias_type",
      # "label_alias",
      # "label_annotation",
      # "label_attribute_type",
      # "label_attribute_type_allowed_value",
      # "label_attribute",
      # "label_ipi",
      # "label_isni",
      # "label_meta",
      # "label_gid_redirect",
      # "label_tag",
      # "label_type",
      # "language",
      # "link",
      # "link_attribute",
      # "link_attribute_type",
      # "link_creditable_attribute_type",
      # "link_attribute_credit",
      # "link_text_attribute_type",
      # "link_attribute_text_value",
      # "link_type",
      # "link_type_attribute_type",
      # "editor_collection",
      # "editor_collection_type",
      # "editor_collection_collaborator",
      # "editor_collection_area",
      # "editor_collection_artist",
      # "editor_collection_event",
      # "editor_collection_instrument",
      # "editor_collection_label",
      # "editor_collection_place",
      # "editor_collection_recording",
      # "editor_collection_release",
      # "editor_collection_release_group",
      # "editor_collection_series",
      # "editor_collection_work",
      # "editor_collection_deleted_entity",
      # "editor_oauth_token",
      # "editor_watch_preferences",
      # "editor_watch_artist",
      # "editor_watch_release_group_type",
      # "editor_watch_release_status",
      # "medium",
      # "medium_attribute_type",
      # "medium_attribute_type_allowed_format",
      # "medium_attribute_type_allowed_value",
      # "medium_attribute_type_allowed_value_allowed_format",
      # "medium_attribute",
      # "medium_cdtoc",
      # "medium_format",
      # "orderable_link_type",
      # "place",
      # "place_alias",
      # "place_alias_type",
      # "place_annotation",
      # "place_attribute_type",
      # "place_attribute_type_allowed_value",
      # "place_attribute",
      # "place_gid_redirect",
      # "place_tag",
      # "place_tag_raw",
      # "place_type",
      # "replication_control",
      "recording",
      # "recording_alias_type",
      # "recording_alias",
      # "recording_rating_raw",
      # "recording_tag_raw",
      # "recording_annotation",
      # "recording_attribute_type",
      # "recording_attribute_type_allowed_value",
      # "recording_attribute",
      # "recording_meta",
      # "recording_gid_redirect",
      # "recording_tag",
      "release",
      # "release_alias_type",
      # "release_alias",
      # "release_country",
      # "release_unknown_country",
      # "release_raw",
      # "release_tag_raw",
      # "release_annotation",
      # "release_attribute_type",
      # "release_attribute_type_allowed_value",
      # "release_attribute",
      # "release_gid_redirect",
      # "release_meta",
      # "release_coverart",
      # "release_label",
      # "release_packaging",
      # "release_status",
      # "release_tag",
      "release_group",
      # "release_group_alias_type",
      # "release_group_alias",
      # "release_group_rating_raw",
      # "release_group_tag_raw",
      # "release_group_annotation",
      # "release_group_attribute_type",
      # "release_group_attribute_type_allowed_value",
      # "release_group_attribute",
      # "release_group_gid_redirect",
      # "release_group_meta",
      # "release_group_tag",
      # "release_group_primary_type",
      # "release_group_secondary_type",
      # "release_group_secondary_type_join",
      # "script",
      # "series",
      # "series_type",
      # "series_ordering_type",
      # "series_gid_redirect",
      # "series_alias_type",
      # "series_alias",
      # "series_annotation",
      # "series_attribute_type",
      # "series_attribute_type_allowed_value",
      # "series_attribute",
      # "series_tag",
      # "series_tag_raw",
      # "tag",
      # "tag_relation",
      "track",
      # "track_gid_redirect",
      # "track_raw",
      # "medium_index",
      # "url",
      # "url_gid_redirect",
      # "vote",
      # "work",
      # "work_language",
      # "work_rating_raw",
      # "work_tag_raw",
      # "work_alias_type",
      # "work_alias",
      # "work_annotation",
      # "work_gid_redirect",
      # "work_meta",
      # "work_tag",
      # "work_type",
      # "work_attribute_type",
      # "work_attribute_type_allowed_value",
      # "work_attribute",
      # "release_event",
      # "event_series",
      # "recording_series",
      # "release_series",
      # "release_group_series",
      # "work_series",
    ].freeze

    class << self
      delegate_missing_to :instance
    end

    attr_accessor :schema
  end
end
