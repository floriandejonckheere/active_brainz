# frozen_string_literal: true

FactoryBot.define do
  factory :artist_type, class: "ActiveBrainz::ArtistType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_artists do
      artist_type_artists { build_list(:artist, 3) }
    end

    trait :with_parent do
      artist_type_parent { build(:artist_type) }
    end

    trait :with_children do
      artist_type_children { build_list(:artist_type, 3) }
    end
  end
end
