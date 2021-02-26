# frozen_string_literal: true

FactoryBot.define do
  factory :place, class: "ActiveBrainz::Place" do
    gid { FFaker::Guid.guid }

    association :place_area, factory: :area
    association :place_type, factory: :place_type

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }

    address { FFaker::Lorem.word }
    coordinates { [FFaker::Geolocation.lat, FFaker::Geolocation.lng] }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

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

    # trait :with_edit_places do
    #   edit_places { build_list(:edit_place, 3) }
    # end

    # trait :with_editor_collection_places do
    #   editor_collection_places { build_list(:editor_collection_place, 3) }
    # end

    trait :with_place_aliases do
      place_aliases { build_list(:place_alias, 3) }
    end

    # trait :with_place_annotations do
    #   place_annotations { build_list(:place_annotation, 3) }
    # end

    # trait :with_place_attributes do
    #   place_attributes { build_list(:place_attribute, 3) }
    # end

    # trait :with_place_gid_redirects do
    #   place_gid_redirects { build_list(:place_gid_redirect, 3) }
    # end

    # trait :with_place_tag_raws do
    #   place_tag_raws { build_list(:place_tag_raw, 3) }
    # end

    # trait :with_place_tags do
    #   place_tags { build_list(:place_tag, 3) }
    # end
  end
end
