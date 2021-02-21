# frozen_string_literal: true

FactoryBot.define do
  factory :artist_alias_type, class: "ActiveBrainz::ArtistAliasType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Lorem.word }
    description { FFaker::Lorem.word }

    sequence(:child_order)

    trait :with_artist_aliases do
      artist_aliases { build_list(:artist_alias, 3) }
    end

    trait :with_parent do
      parent { build(:artist_alias_type) }
    end

    trait :with_children do
      children { build_list(:artist_alias_type, 3) }
    end
  end
end
