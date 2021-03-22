# frozen_string_literal: true

RSpec.describe ActiveBrainz::Link, type: :model do
  subject(:link) { build(:link) }

  it_behaves_like "it has a begin and end date"

  # it { is_expected.to have_many :l_area_areas }
  # it { is_expected.to have_many :l_area_artists }
  # it { is_expected.to have_many :l_area_events }
  # it { is_expected.to have_many :l_area_instruments }
  # it { is_expected.to have_many :l_area_labels }
  # it { is_expected.to have_many :l_area_places }
  # it { is_expected.to have_many :l_area_recordings }
  # it { is_expected.to have_many :l_area_release_groups }
  # it { is_expected.to have_many :l_area_releases }
  # it { is_expected.to have_many :l_area_series }
  # it { is_expected.to have_many :l_area_urls }
  # it { is_expected.to have_many :l_area_works }
  # it { is_expected.to have_many :l_artist_artists }
  # it { is_expected.to have_many :l_artist_events }
  # it { is_expected.to have_many :l_artist_instruments }
  # it { is_expected.to have_many :l_artist_labels }
  # it { is_expected.to have_many :l_artist_places }
  # it { is_expected.to have_many :l_artist_recordings }
  # it { is_expected.to have_many :l_artist_release_groups }
  # it { is_expected.to have_many :l_artist_releases }
  # it { is_expected.to have_many :l_artist_series }
  # it { is_expected.to have_many :l_artist_urls }
  # it { is_expected.to have_many :l_artist_works }
  # it { is_expected.to have_many :l_event_events }
  # it { is_expected.to have_many :l_event_instruments }
  # it { is_expected.to have_many :l_event_labels }
  # it { is_expected.to have_many :l_event_places }
  # it { is_expected.to have_many :l_event_recordings }
  # it { is_expected.to have_many :l_event_release_groups }
  # it { is_expected.to have_many :l_event_releases }
  # it { is_expected.to have_many :l_event_series }
  # it { is_expected.to have_many :l_event_urls }
  # it { is_expected.to have_many :l_event_works }
  # it { is_expected.to have_many :l_instrument_instruments }
  # it { is_expected.to have_many :l_instrument_labels }
  # it { is_expected.to have_many :l_instrument_places }
  # it { is_expected.to have_many :l_instrument_recordings }
  # it { is_expected.to have_many :l_instrument_release_groups }
  # it { is_expected.to have_many :l_instrument_releases }
  # it { is_expected.to have_many :l_instrument_series }
  # it { is_expected.to have_many :l_instrument_urls }
  # it { is_expected.to have_many :l_instrument_works }
  # it { is_expected.to have_many :l_label_labels }
  # it { is_expected.to have_many :l_label_places }
  # it { is_expected.to have_many :l_label_recordings }
  # it { is_expected.to have_many :l_label_release_groups }
  # it { is_expected.to have_many :l_label_releases }
  # it { is_expected.to have_many :l_label_series }
  # it { is_expected.to have_many :l_label_urls }
  # it { is_expected.to have_many :l_label_works }
  # it { is_expected.to have_many :l_place_places }
  # it { is_expected.to have_many :l_place_recordings }
  # it { is_expected.to have_many :l_place_release_groups }
  # it { is_expected.to have_many :l_place_releases }
  # it { is_expected.to have_many :l_place_series }
  # it { is_expected.to have_many :l_place_urls }
  # it { is_expected.to have_many :l_place_works }
  # it { is_expected.to have_many :l_recording_recordings }
  # it { is_expected.to have_many :l_recording_release_groups }
  # it { is_expected.to have_many :l_recording_releases }
  # it { is_expected.to have_many :l_recording_series }
  # it { is_expected.to have_many :l_recording_urls }
  # it { is_expected.to have_many :l_recording_works }
  # it { is_expected.to have_many :l_release_group_release_groups }
  # it { is_expected.to have_many :l_release_group_series }
  # it { is_expected.to have_many :l_release_group_urls }
  # it { is_expected.to have_many :l_release_group_works }
  # it { is_expected.to have_many :l_release_release_groups }
  # it { is_expected.to have_many :l_release_releases }
  # it { is_expected.to have_many :l_release_series }
  # it { is_expected.to have_many :l_release_urls }
  # it { is_expected.to have_many :l_release_works }
  # it { is_expected.to have_many :l_series_series }
  # it { is_expected.to have_many :l_series_urls }
  # it { is_expected.to have_many :l_series_works }
  # it { is_expected.to have_many :l_url_urls }
  # it { is_expected.to have_many :l_url_works }
  # it { is_expected.to have_many :l_work_works }
  # it { is_expected.to have_many :link_attribute_credits }
  # it { is_expected.to have_many :link_attribute_text_values }
  # it { is_expected.to have_many :link_attributes }
  it { is_expected.to belong_to(:link_link_type).optional }

  it { is_expected.to respond_to :created }
  it { is_expected.to respond_to :attribute_count }
end
