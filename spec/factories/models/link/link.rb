# frozen_string_literal: true

FactoryBot.define do
  factory :link, class: "ActiveBrainz::Link" do
    association :link_link_type, factory: :link_type

    created { FFaker::Time.datetime }
    attribute_count { FFaker::Random.rand(10) }

    transient do
      begin_date { [FFaker::Time.date, nil].sample }
    end

    begin_date_year { begin_date&.year }
    begin_date_month { begin_date&.month }
    begin_date_day { begin_date&.day }

    transient do
      end_date { [FFaker::Time.date, nil].sample }
    end

    end_date_year { end_date&.year }
    end_date_month { end_date&.month }
    end_date_day { end_date&.day }

    ended { end_date.present? }

    trait :with_area_areas do
      area_areas { build_list(:area_area, 3) }
    end

    # trait :with_area_artists do
    #   area_artists { build_list(:area_artist, 3) }
    # end

    # trait :with_area_events do
    #   area_events { build_list(:area_event, 3) }
    # end

    # trait :with_area_instruments do
    #   area_instruments { build_list(:area_instrument, 3) }
    # end

    # trait :with_area_labels do
    #   area_labels { build_list(:area_label, 3) }
    # end

    # trait :with_area_places do
    #   area_places { build_list(:area_place, 3) }
    # end

    # trait :with_area_recordings do
    #   area_recordings { build_list(:area_recording, 3) }
    # end

    # trait :with_area_release_groups do
    #   area_release_groups { build_list(:area_release_group, 3) }
    # end

    # trait :with_area_releases do
    #   area_releases { build_list(:area_release, 3) }
    # end

    # trait :with_area_series do
    #   area_series { build_list(:area_series, 3) }
    # end

    # trait :with_area_urls do
    #   area_urls { build_list(:area_url, 3) }
    # end

    # trait :with_area_works do
    #   area_works { build_list(:area_work, 3) }
    # end

    # trait :with_artist_artists do
    #   artist_artists { build_list(:artist_artist, 3) }
    # end

    # trait :with_artist_events do
    #   artist_events { build_list(:artist_event, 3) }
    # end

    # trait :with_artist_instruments do
    #   artist_instruments { build_list(:artist_instrument, 3) }
    # end

    # trait :with_artist_labels do
    #   artist_labels { build_list(:artist_label, 3) }
    # end

    # trait :with_artist_places do
    #   artist_places { build_list(:artist_place, 3) }
    # end

    # trait :with_artist_recordings do
    #   artist_recordings { build_list(:artist_recording, 3) }
    # end

    # trait :with_artist_release_groups do
    #   artist_release_groups { build_list(:artist_release_group, 3) }
    # end

    # trait :with_artist_releases do
    #   artist_releases { build_list(:artist_release, 3) }
    # end

    # trait :with_artist_series do
    #   artist_series { build_list(:artist_series, 3) }
    # end

    # trait :with_artist_urls do
    #   artist_urls { build_list(:artist_url, 3) }
    # end

    # trait :with_artist_works do
    #   artist_works { build_list(:artist_work, 3) }
    # end

    # trait :with_event_events do
    #   event_events { build_list(:event_event, 3) }
    # end

    # trait :with_event_instruments do
    #   event_instruments { build_list(:event_instrument, 3) }
    # end

    # trait :with_event_labels do
    #   event_labels { build_list(:event_label, 3) }
    # end

    # trait :with_event_places do
    #   event_places { build_list(:event_place, 3) }
    # end

    # trait :with_event_recordings do
    #   event_recordings { build_list(:event_recording, 3) }
    # end

    # trait :with_event_release_groups do
    #   event_release_groups { build_list(:event_release_group, 3) }
    # end

    # trait :with_event_releases do
    #   event_releases { build_list(:event_release, 3) }
    # end

    # trait :with_event_series do
    #   event_series { build_list(:event_series, 3) }
    # end

    # trait :with_event_urls do
    #   event_urls { build_list(:event_url, 3) }
    # end

    # trait :with_event_works do
    #   event_works { build_list(:event_work, 3) }
    # end

    # trait :with_instrument_instruments do
    #   instrument_instruments { build_list(:instrument_instrument, 3) }
    # end

    # trait :with_instrument_labels do
    #   instrument_labels { build_list(:instrument_label, 3) }
    # end

    # trait :with_instrument_places do
    #   instrument_places { build_list(:instrument_place, 3) }
    # end

    # trait :with_instrument_recordings do
    #   instrument_recordings { build_list(:instrument_recording, 3) }
    # end

    # trait :with_instrument_release_groups do
    #   instrument_release_groups { build_list(:instrument_release_group, 3) }
    # end

    # trait :with_instrument_releases do
    #   instrument_releases { build_list(:instrument_release, 3) }
    # end

    # trait :with_instrument_series do
    #   instrument_series { build_list(:instrument_series, 3) }
    # end

    # trait :with_instrument_urls do
    #   instrument_urls { build_list(:instrument_url, 3) }
    # end

    # trait :with_instrument_works do
    #   instrument_works { build_list(:instrument_work, 3) }
    # end

    # trait :with_labelabels do
    #   labelabels { build_list(:labelabel, 3) }
    # end

    # trait :with_labeplaces do
    #   labeplaces { build_list(:labeplace, 3) }
    # end

    # trait :with_laberecordings do
    #   laberecordings { build_list(:laberecording, 3) }
    # end

    # trait :with_laberelease_groups do
    #   laberelease_groups { build_list(:laberelease_group, 3) }
    # end

    # trait :with_labereleases do
    #   labereleases { build_list(:laberelease, 3) }
    # end

    # trait :with_labeseries do
    #   labeseries { build_list(:labeseries, 3) }
    # end

    # trait :with_labeurls do
    #   labeurls { build_list(:labeurl, 3) }
    # end

    # trait :with_labeworks do
    #   labeworks { build_list(:labework, 3) }
    # end

    # trait :with_place_places do
    #   place_places { build_list(:place_place, 3) }
    # end

    # trait :with_place_recordings do
    #   place_recordings { build_list(:place_recording, 3) }
    # end

    # trait :with_place_release_groups do
    #   place_release_groups { build_list(:place_release_group, 3) }
    # end

    # trait :with_place_releases do
    #   place_releases { build_list(:place_release, 3) }
    # end

    # trait :with_place_series do
    #   place_series { build_list(:place_series, 3) }
    # end

    # trait :with_place_urls do
    #   place_urls { build_list(:place_url, 3) }
    # end

    # trait :with_place_works do
    #   place_works { build_list(:place_work, 3) }
    # end

    # trait :with_recording_recordings do
    #   recording_recordings { build_list(:recording_recording, 3) }
    # end

    # trait :with_recording_release_groups do
    #   recording_release_groups { build_list(:recording_release_group, 3) }
    # end

    # trait :with_recording_releases do
    #   recording_releases { build_list(:recording_release, 3) }
    # end

    # trait :with_recording_series do
    #   recording_series { build_list(:recording_series, 3) }
    # end

    # trait :with_recording_urls do
    #   recording_urls { build_list(:recording_url, 3) }
    # end

    # trait :with_recording_works do
    #   recording_works { build_list(:recording_work, 3) }
    # end

    # trait :with_release_group_release_groups do
    #   release_group_release_groups { build_list(:release_group_release_group, 3) }
    # end

    # trait :with_release_group_series do
    #   release_group_series { build_list(:release_group_series, 3) }
    # end

    # trait :with_release_group_urls do
    #   release_group_urls { build_list(:release_group_url, 3) }
    # end

    # trait :with_release_group_works do
    #   release_group_works { build_list(:release_group_work, 3) }
    # end

    # trait :with_release_release_groups do
    #   release_release_groups { build_list(:release_release_group, 3) }
    # end

    # trait :with_release_releases do
    #   release_releases { build_list(:release_release, 3) }
    # end

    # trait :with_release_series do
    #   release_series { build_list(:release_series, 3) }
    # end

    # trait :with_release_urls do
    #   release_urls { build_list(:release_url, 3) }
    # end

    # trait :with_release_works do
    #   release_works { build_list(:release_work, 3) }
    # end

    # trait :with_series_series do
    #   series_series { build_list(:series_series, 3) }
    # end

    # trait :with_series_urls do
    #   series_urls { build_list(:series_url, 3) }
    # end

    # trait :with_series_works do
    #   series_works { build_list(:series_work, 3) }
    # end

    # trait :with_ururls do
    #   ururls { build_list(:ururl, 3) }
    # end

    # trait :with_urworks do
    #   urworks { build_list(:urwork, 3) }
    # end

    # trait :with_work_works do
    #   work_works { build_list(:work_work, 3) }
    # end

    # trait :with_link_attribute_credits do
    #   link_attribute_credits { build_list(:link_attribute_credit, 3) }
    # end

    # trait :with_link_attribute_text_values do
    #   link_attribute_text_values { build_list(:link_attribute_text_value, 3) }
    # end

    # trait :with_link_attributes do
    #   link_attributes { build_list(:link_attribute, 3) }
    # end
  end
end
