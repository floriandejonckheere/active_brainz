# frozen_string_literal: true

FactoryBot.define do
  factory :artist, class: "ActiveBrainz::Artist" do
    gid { FFaker::Guid.guid }

    association :artist_area, factory: :area
    association :artist_type, factory: :artist_type
    association :artist_begin_area, factory: :area
    association :artist_end_area, factory: :area
    association :artist_gender, factory: :gender

    name { FFaker::Name.name }
    sort_name { FFaker::Name.name }

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

    trait :with_artist_aliases do
      artist_aliases { build_list(:artist_alias, 3) }
    end

    # trait :with_artist_annotations do
    #   artist_annotations { build_list(:artist_annotation, 3) }
    # end

    # trait :with_artist_attributes do
    #   artist_attributes { build_list(:artist_attribute, 3) }
    # end

    trait :with_artist_credit_names do
      artist_credit_names { build_list(:artist_credit_name, 3) }
    end

    # trait :with_artist_gid_redirects do
    #   artist_gid_redirects { build_list(:artist_gid_redirect, 3) }
    # end

    # trait :with_artist_ipis do
    #   artist_ipis { build_list(:artist_ipi, 3) }
    # end

    # trait :with_artist_isnis do
    #   artist_isnis { build_list(:artist_isni, 3) }
    # end

    # trait :with_artist_meta do
    #   artist_meta { build_list(:artist_meta, 3) }
    # end

    # trait :with_artist_rating_raws do
    #   artist_rating_raws { build_list(:artist_rating_raw, 3) }
    # end

    # trait :with_artist_tag_raws do
    #   artist_tag_raws { build_list(:artist_tag_raw, 3) }
    # end

    # trait :with_artist_tags do
    #   artist_tags { build_list(:artist_tag, 3) }
    # end

    # trait :with_edit_artists do
    #   edit_artists { build_list(:edit_artist, 3) }
    # end

    # trait :with_editor_collection_artists do
    #   editor_collection_artists { build_list(:editor_collection_artist, 3) }
    # end

    # trait :with_editor_subscribe_artists do
    #   editor_subscribe_artists { build_list(:editor_subscribe_artist, 3) }
    # end

    # trait :with_editor_watch_artists do
    #   editor_watch_artists { build_list(:editor_watch_artist, 3) }
    # end
  end
end
