# frozen_string_literal: true

FactoryBot.define do
  factory :artist_credit, class: "ActiveBrainz::ArtistCredit" do
    name { FFaker::Lorem.word }

    edits_pending { FFaker::Lorem.word }
    artist_count { FFaker::Lorem.word }
    ref_count { FFaker::Lorem.word }

    created { FFaker::Lorem.word }

    # trait :with_alternative_releases do
    #   alternative_releases { build_list(:alternative_release, 3) }
    # end

    # trait :with_alternative_tracks do
    #   alternative_tracks { build_list(:alternative_track, 3) }
    # end

    trait :with_artist_credit_names do
      artist_credit_names { build_list(:artist_credit_name, 3) }
    end

    # trait :with_recordings do
    #   recordings { build_list(:recording, 3) }
    # end

    trait :with_release_groups do
      release_groups { build_list(:release_group, 3) }
    end

    trait :with_releases do
      releases { build_list(:release, 3) }
    end

    trait :with_tracks do
      tracks { build_list(:track, 3) }
    end
  end
end
