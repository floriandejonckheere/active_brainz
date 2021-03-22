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

    # trait :with_l_area_areas do
    #   l_area_areas { build_list(:l_area_area, 3) }
    # end

    # trait :with_l_area_artists do
    #   l_area_artists { build_list(:l_area_artist, 3) }
    # end

    # trait :with_l_area_events do
    #   l_area_events { build_list(:l_area_event, 3) }
    # end

    # trait :with_l_area_instruments do
    #   l_area_instruments { build_list(:l_area_instrument, 3) }
    # end

    # trait :with_l_area_labels do
    #   l_area_labels { build_list(:l_area_label, 3) }
    # end

    # trait :with_l_area_places do
    #   l_area_places { build_list(:l_area_place, 3) }
    # end

    # trait :with_l_area_recordings do
    #   l_area_recordings { build_list(:l_area_recording, 3) }
    # end

    # trait :with_l_area_release_groups do
    #   l_area_release_groups { build_list(:l_area_release_group, 3) }
    # end

    # trait :with_l_area_releases do
    #   l_area_releases { build_list(:l_area_release, 3) }
    # end

    # trait :with_l_area_series do
    #   l_area_series { build_list(:l_area_series, 3) }
    # end

    # trait :with_l_area_urls do
    #   l_area_urls { build_list(:l_area_url, 3) }
    # end

    # trait :with_l_area_works do
    #   l_area_works { build_list(:l_area_work, 3) }
    # end

    # trait :with_l_artist_artists do
    #   l_artist_artists { build_list(:l_artist_artist, 3) }
    # end

    # trait :with_l_artist_events do
    #   l_artist_events { build_list(:l_artist_event, 3) }
    # end

    # trait :with_l_artist_instruments do
    #   l_artist_instruments { build_list(:l_artist_instrument, 3) }
    # end

    # trait :with_l_artist_labels do
    #   l_artist_labels { build_list(:l_artist_label, 3) }
    # end

    # trait :with_l_artist_places do
    #   l_artist_places { build_list(:l_artist_place, 3) }
    # end

    # trait :with_l_artist_recordings do
    #   l_artist_recordings { build_list(:l_artist_recording, 3) }
    # end

    # trait :with_l_artist_release_groups do
    #   l_artist_release_groups { build_list(:l_artist_release_group, 3) }
    # end

    # trait :with_l_artist_releases do
    #   l_artist_releases { build_list(:l_artist_release, 3) }
    # end

    # trait :with_l_artist_series do
    #   l_artist_series { build_list(:l_artist_series, 3) }
    # end

    # trait :with_l_artist_urls do
    #   l_artist_urls { build_list(:l_artist_url, 3) }
    # end

    # trait :with_l_artist_works do
    #   l_artist_works { build_list(:l_artist_work, 3) }
    # end

    # trait :with_l_event_events do
    #   l_event_events { build_list(:l_event_event, 3) }
    # end

    # trait :with_l_event_instruments do
    #   l_event_instruments { build_list(:l_event_instrument, 3) }
    # end

    # trait :with_l_event_labels do
    #   l_event_labels { build_list(:l_event_label, 3) }
    # end

    # trait :with_l_event_places do
    #   l_event_places { build_list(:l_event_place, 3) }
    # end

    # trait :with_l_event_recordings do
    #   l_event_recordings { build_list(:l_event_recording, 3) }
    # end

    # trait :with_l_event_release_groups do
    #   l_event_release_groups { build_list(:l_event_release_group, 3) }
    # end

    # trait :with_l_event_releases do
    #   l_event_releases { build_list(:l_event_release, 3) }
    # end

    # trait :with_l_event_series do
    #   l_event_series { build_list(:l_event_series, 3) }
    # end

    # trait :with_l_event_urls do
    #   l_event_urls { build_list(:l_event_url, 3) }
    # end

    # trait :with_l_event_works do
    #   l_event_works { build_list(:l_event_work, 3) }
    # end

    # trait :with_l_instrument_instruments do
    #   l_instrument_instruments { build_list(:l_instrument_instrument, 3) }
    # end

    # trait :with_l_instrument_labels do
    #   l_instrument_labels { build_list(:l_instrument_label, 3) }
    # end

    # trait :with_l_instrument_places do
    #   l_instrument_places { build_list(:l_instrument_place, 3) }
    # end

    # trait :with_l_instrument_recordings do
    #   l_instrument_recordings { build_list(:l_instrument_recording, 3) }
    # end

    # trait :with_l_instrument_release_groups do
    #   l_instrument_release_groups { build_list(:l_instrument_release_group, 3) }
    # end

    # trait :with_l_instrument_releases do
    #   l_instrument_releases { build_list(:l_instrument_release, 3) }
    # end

    # trait :with_l_instrument_series do
    #   l_instrument_series { build_list(:l_instrument_series, 3) }
    # end

    # trait :with_l_instrument_urls do
    #   l_instrument_urls { build_list(:l_instrument_url, 3) }
    # end

    # trait :with_l_instrument_works do
    #   l_instrument_works { build_list(:l_instrument_work, 3) }
    # end

    # trait :with_l_label_labels do
    #   l_label_labels { build_list(:l_label_label, 3) }
    # end

    # trait :with_l_label_places do
    #   l_label_places { build_list(:l_label_place, 3) }
    # end

    # trait :with_l_label_recordings do
    #   l_label_recordings { build_list(:l_label_recording, 3) }
    # end

    # trait :with_l_label_release_groups do
    #   l_label_release_groups { build_list(:l_label_release_group, 3) }
    # end

    # trait :with_l_label_releases do
    #   l_label_releases { build_list(:l_label_release, 3) }
    # end

    # trait :with_l_label_series do
    #   l_label_series { build_list(:l_label_series, 3) }
    # end

    # trait :with_l_label_urls do
    #   l_label_urls { build_list(:l_label_url, 3) }
    # end

    # trait :with_l_label_works do
    #   l_label_works { build_list(:l_label_work, 3) }
    # end

    # trait :with_l_place_places do
    #   l_place_places { build_list(:l_place_place, 3) }
    # end

    # trait :with_l_place_recordings do
    #   l_place_recordings { build_list(:l_place_recording, 3) }
    # end

    # trait :with_l_place_release_groups do
    #   l_place_release_groups { build_list(:l_place_release_group, 3) }
    # end

    # trait :with_l_place_releases do
    #   l_place_releases { build_list(:l_place_release, 3) }
    # end

    # trait :with_l_place_series do
    #   l_place_series { build_list(:l_place_series, 3) }
    # end

    # trait :with_l_place_urls do
    #   l_place_urls { build_list(:l_place_url, 3) }
    # end

    # trait :with_l_place_works do
    #   l_place_works { build_list(:l_place_work, 3) }
    # end

    # trait :with_l_recording_recordings do
    #   l_recording_recordings { build_list(:l_recording_recording, 3) }
    # end

    # trait :with_l_recording_release_groups do
    #   l_recording_release_groups { build_list(:l_recording_release_group, 3) }
    # end

    # trait :with_l_recording_releases do
    #   l_recording_releases { build_list(:l_recording_release, 3) }
    # end

    # trait :with_l_recording_series do
    #   l_recording_series { build_list(:l_recording_series, 3) }
    # end

    # trait :with_l_recording_urls do
    #   l_recording_urls { build_list(:l_recording_url, 3) }
    # end

    # trait :with_l_recording_works do
    #   l_recording_works { build_list(:l_recording_work, 3) }
    # end

    # trait :with_l_release_group_release_groups do
    #   l_release_group_release_groups { build_list(:l_release_group_release_group, 3) }
    # end

    # trait :with_l_release_group_series do
    #   l_release_group_series { build_list(:l_release_group_series, 3) }
    # end

    # trait :with_l_release_group_urls do
    #   l_release_group_urls { build_list(:l_release_group_url, 3) }
    # end

    # trait :with_l_release_group_works do
    #   l_release_group_works { build_list(:l_release_group_work, 3) }
    # end

    # trait :with_l_release_release_groups do
    #   l_release_release_groups { build_list(:l_release_release_group, 3) }
    # end

    # trait :with_l_release_releases do
    #   l_release_releases { build_list(:l_release_release, 3) }
    # end

    # trait :with_l_release_series do
    #   l_release_series { build_list(:l_release_series, 3) }
    # end

    # trait :with_l_release_urls do
    #   l_release_urls { build_list(:l_release_url, 3) }
    # end

    # trait :with_l_release_works do
    #   l_release_works { build_list(:l_release_work, 3) }
    # end

    # trait :with_l_series_series do
    #   l_series_series { build_list(:l_series_series, 3) }
    # end

    # trait :with_l_series_urls do
    #   l_series_urls { build_list(:l_series_url, 3) }
    # end

    # trait :with_l_series_works do
    #   l_series_works { build_list(:l_series_work, 3) }
    # end

    # trait :with_l_url_urls do
    #   l_url_urls { build_list(:l_url_url, 3) }
    # end

    # trait :with_l_url_works do
    #   l_url_works { build_list(:l_url_work, 3) }
    # end

    # trait :with_l_work_works do
    #   l_work_works { build_list(:l_work_work, 3) }
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
