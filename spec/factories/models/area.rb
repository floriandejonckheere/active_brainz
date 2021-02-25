# frozen_string_literal: true

FactoryBot.define do
  factory :area, class: "ActiveBrainz::Area" do
    gid { FFaker::Guid.guid }

    association :area_type, factory: :area_type

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }

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

    # trait :with_area_aliases do
    #   area_aliases { build_list(:area_alias, 3) }
    # end

    # trait :with_area_annotations do
    #   area_annotations { build_list(:area_annotation, 3) }
    # end

    # trait :with_area_attributes do
    #   area_attributes { build_list(:area_attribute, 3) }
    # end

    # trait :with_area_gid_redirects do
    #   area_gid_redirects { build_list(:area_gid_redirect, 3) }
    # end

    # trait :with_area_tag_raws do
    #   area_tag_raws { build_list(:area_tag_raw, 3) }
    # end

    # trait :with_area_tags do
    #   area_tags { build_list(:area_tag, 3) }
    # end

    trait :with_artists do
      artists { build_list(:artist, 3) }
    end

    trait :with_begin_area_artists do
      begin_area_artists { build_list(:artist, 3) }
    end

    trait :with_end_area_artists do
      end_area_artists { build_list(:artist, 3) }
    end

    # trait :with_country_areas do
    #   country_areas { build_list(:country_area, 3) }
    # end

    # trait :with_edit_areas do
    #   edit_areas { build_list(:edit_area, 3) }
    # end

    # trait :with_editor_collection_areas do
    #   editor_collection_areas { build_list(:editor_collection_area, 3) }
    # end

    # trait :with_editors do
    #   editors { build_list(:editor, 3) }
    # end

    # trait :with_iso_3166_1s do
    #   iso_3166_1s { build_list(:iso_3166_1, 3) }
    # end

    # trait :with_iso_3166_2s do
    #   iso_3166_2s { build_list(:iso_3166_2, 3) }
    # end

    # trait :with_iso_3166_3s do
    #   iso_3166_3s { build_list(:iso_3166_3, 3) }
    # end

    trait :with_labels do
      labels { build_list(:label, 3) }
    end

    # trait :with_places do
    #   places { build_list(:place, 3) }
    # end
  end
end
