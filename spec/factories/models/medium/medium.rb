# frozen_string_literal: true

FactoryBot.define do
  factory :medium, class: "ActiveBrainz::Medium" do
    # association :medium_format, factory: :medium_format
    association :medium_release, factory: :release

    name { FFaker::Name.name }
    position { FFaker::Random.rand(10) }
    track_count { FFaker::Random.rand }

    edits_pending { FFaker::Lorem.word }
    last_updated { FFaker::Lorem.word }

    # trait :with_alternative_media do
    #   alternative_media { build_list(:alternative_medium, 3) }
    # end

    # trait :with_medium_attributes do
    #   medium_attributes { build_list(:medium_attribute, 3) }
    # end

    # trait :with_medium_cdtocs do
    #   medium_cdtocs { build_list(:medium_cdtoc, 3) }
    # end

    # trait :with_medium_indices do
    #   medium_indices { build_list(:medium_index, 3) }
    # end

    trait :with_tracks do
      tracks { build_list(:track, 3) }
    end
  end
end
