# frozen_string_literal: true

FactoryBot.define do
  factory :release, class: "ActiveBrainz::Release" do
    gid { FFaker::Guid.guid }

    association :release_artist_credit, factory: :artist_credit
    # association :release_language, factory: :language
    # association :release_packaging, factory: :release_packaging
    association :release_release_group, factory: :release_group
    # association :release_script, factory: :script
    # association :release_status, factory: :release_status

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }

    barcode { FFaker::Lorem.word }

    quality { FFaker::Random.rand(10) }
    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    # trait :with_alternative_releases do
    #   alternative_releases { build_list(:alternative_release, 3) }
    # end

    # trait :with_edit_releases do
    #   edit_releases { build_list(:edit_release, 3) }
    # end

    # trait :with_editor_collection_releases do
    #   editor_collection_releases { build_list(:editor_collection_release, 3) }
    # end

    trait :with_media do
      media { build_list(:medium, 3) }
    end

    # trait :with_release_aliases do
    #   release_aliases { build_list(:release_alias, 3) }
    # end

    # trait :with_release_annotations do
    #   release_annotations { build_list(:release_annotation, 3) }
    # end

    # trait :with_release_attributes do
    #   release_attributes { build_list(:release_attribute, 3) }
    # end

    # trait :with_release_countries do
    #   release_countries { build_list(:release_country, 3) }
    # end

    # trait :with_release_coverarts do
    #   release_coverarts { build_list(:release_coverart, 3) }
    # end

    # trait :with_release_first_release_dates do
    #   release_first_release_dates { build_list(:release_first_release_date, 3) }
    # end

    # trait :with_release_gid_redirects do
    #   release_gid_redirects { build_list(:release_gid_redirect, 3) }
    # end

    # trait :with_release_labels do
    #   release_labels { build_list(:release_label, 3) }
    # end

    # trait :with_release_meta do
    #   release_meta { build_list(:release_meta, 3) }
    # end

    # trait :with_release_tag_raws do
    #   release_tag_raws { build_list(:release_tag_raw, 3) }
    # end

    # trait :with_release_tags do
    #   release_tags { build_list(:release_tag, 3) }
    # end

    # trait :with_release_unknown_countries do
    #   release_unknown_countries { build_list(:release_unknown_country, 3) }
    # end
  end
end
