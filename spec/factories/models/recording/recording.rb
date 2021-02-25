# frozen_string_literal: true

FactoryBot.define do
  factory :recording, class: "ActiveBrainz::Recording" do
    gid { FFaker::Guid.guid }

    association :recording_artist_credit, factory: :artist_credit

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }
    length { FFaker::Random.rand(300) }
    video { [true, false].sample }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    # trait :with_edit_recordings do
    #   edit_recordings { build_list(:edit_recording, 3) }
    # end

    # trait :with_editor_collection_recordings do
    #   editor_collection_recordings { build_list(:editor_collection_recording, 3) }
    # end

    # trait :with_isrcs do
    #   isrcs { build_list(:isrc, 3) }
    # end

    # trait :with_recording_aliases do
    #   recording_aliases { build_list(:recording_alias, 3) }
    # end

    # trait :with_recording_annotations do
    #   recording_annotations { build_list(:recording_annotation, 3) }
    # end

    # trait :with_recording_attributes do
    #   recording_attributes { build_list(:recording_attribute, 3) }
    # end

    # trait :with_recording_first_release_dates do
    #   recording_first_release_dates { build_list(:recording_first_release_date, 3) }
    # end

    # trait :with_recording_gid_redirects do
    #   recording_gid_redirects { build_list(:recording_gid_redirect, 3) }
    # end

    # trait :with_recording_meta do
    #   recording_meta { build_list(:recording_meta, 3) }
    # end

    # trait :with_recording_rating_raws do
    #   recording_rating_raws { build_list(:recording_rating_raw, 3) }
    # end

    # trait :with_recording_tag_raws do
    #   recording_tag_raws { build_list(:recording_tag_raw, 3) }
    # end

    # trait :with_recording_tags do
    #   recording_tags { build_list(:recording_tag, 3) }
    # end

    trait :with_tracks do
      tracks { build_list(:track, 3) }
    end
  end
end
