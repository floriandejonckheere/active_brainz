# frozen_string_literal: true

RSpec.describe ActiveBrainz::Link, type: :model do
  subject(:link) { build(:link) }

  it_behaves_like "it has a begin and end date"

  it { is_expected.to have_many :area_areas }
  # it { is_expected.to have_many :area_artists }
  # it { is_expected.to have_many :area_events }
  # it { is_expected.to have_many :area_instruments }
  # it { is_expected.to have_many :area_labels }
  # it { is_expected.to have_many :area_places }
  # it { is_expected.to have_many :area_recordings }
  # it { is_expected.to have_many :area_release_groups }
  # it { is_expected.to have_many :area_releases }
  # it { is_expected.to have_many :area_series }
  # it { is_expected.to have_many :area_urls }
  # it { is_expected.to have_many :area_works }
  # it { is_expected.to have_many :artist_artists }
  # it { is_expected.to have_many :artist_events }
  # it { is_expected.to have_many :artist_instruments }
  # it { is_expected.to have_many :artist_labels }
  # it { is_expected.to have_many :artist_places }
  # it { is_expected.to have_many :artist_recordings }
  # it { is_expected.to have_many :artist_release_groups }
  # it { is_expected.to have_many :artist_releases }
  # it { is_expected.to have_many :artist_series }
  # it { is_expected.to have_many :artist_urls }
  # it { is_expected.to have_many :artist_works }
  # it { is_expected.to have_many :event_events }
  # it { is_expected.to have_many :event_instruments }
  # it { is_expected.to have_many :event_labels }
  # it { is_expected.to have_many :event_places }
  # it { is_expected.to have_many :event_recordings }
  # it { is_expected.to have_many :event_release_groups }
  # it { is_expected.to have_many :event_releases }
  # it { is_expected.to have_many :event_series }
  # it { is_expected.to have_many :event_urls }
  # it { is_expected.to have_many :event_works }
  # it { is_expected.to have_many :instrument_instruments }
  # it { is_expected.to have_many :instrument_labels }
  # it { is_expected.to have_many :instrument_places }
  # it { is_expected.to have_many :instrument_recordings }
  # it { is_expected.to have_many :instrument_release_groups }
  # it { is_expected.to have_many :instrument_releases }
  # it { is_expected.to have_many :instrument_series }
  # it { is_expected.to have_many :instrument_urls }
  # it { is_expected.to have_many :instrument_works }
  # it { is_expected.to have_many :labelabels }
  # it { is_expected.to have_many :labeplaces }
  # it { is_expected.to have_many :laberecordings }
  # it { is_expected.to have_many :laberelease_groups }
  # it { is_expected.to have_many :labereleases }
  # it { is_expected.to have_many :labeseries }
  # it { is_expected.to have_many :labeurls }
  # it { is_expected.to have_many :labeworks }
  # it { is_expected.to have_many :place_places }
  # it { is_expected.to have_many :place_recordings }
  # it { is_expected.to have_many :place_release_groups }
  # it { is_expected.to have_many :place_releases }
  # it { is_expected.to have_many :place_series }
  # it { is_expected.to have_many :place_urls }
  # it { is_expected.to have_many :place_works }
  # it { is_expected.to have_many :recording_recordings }
  # it { is_expected.to have_many :recording_release_groups }
  # it { is_expected.to have_many :recording_releases }
  # it { is_expected.to have_many :recording_series }
  # it { is_expected.to have_many :recording_urls }
  # it { is_expected.to have_many :recording_works }
  # it { is_expected.to have_many :release_group_release_groups }
  # it { is_expected.to have_many :release_group_series }
  # it { is_expected.to have_many :release_group_urls }
  # it { is_expected.to have_many :release_group_works }
  # it { is_expected.to have_many :release_release_groups }
  # it { is_expected.to have_many :release_releases }
  # it { is_expected.to have_many :release_series }
  # it { is_expected.to have_many :release_urls }
  # it { is_expected.to have_many :release_works }
  # it { is_expected.to have_many :series_series }
  # it { is_expected.to have_many :series_urls }
  # it { is_expected.to have_many :series_works }
  # it { is_expected.to have_many :ururls }
  # it { is_expected.to have_many :urworks }
  # it { is_expected.to have_many :work_works }
  # it { is_expected.to have_many :link_attribute_credits }
  # it { is_expected.to have_many :link_attribute_text_values }
  # it { is_expected.to have_many :link_attributes }
  it { is_expected.to belong_to(:link_link_type).optional }

  it { is_expected.to respond_to :created }
  it { is_expected.to respond_to :attribute_count }
end
