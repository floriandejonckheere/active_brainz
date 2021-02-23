# frozen_string_literal: true

FactoryBot.define do
  factory :track, class: "ActiveBrainz::Track" do
    gid { FFaker::Guid.guid }

    association :track_artist_credit, factory: :artist_credit
    # association :track_medium, factory: :medium
    # association :track_recording, factory: :recording

    name { FFaker::Name.name }
    sequence(:number)
    sequence(:position)
    length { FFaker::Random.rand(300) }
    is_data_track { [true, false].sample }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    # trait :with_alternative_medium_tracks do
    #   alternative_medium_tracks { build_list(:alternative_medium_track, 3) }
    # end

    # trait :with_track_gid_redirects do
    #   track_gid_redirects { build_list(:track_gid_redirect, 3) }
    # end
  end
end
