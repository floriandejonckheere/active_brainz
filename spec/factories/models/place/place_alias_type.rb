# frozen_string_literal: true

FactoryBot.define do
  factory :place_alias_type, class: "ActiveBrainz::PlaceAliasType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_place_aliases do
      place_aliases { build_list(:place_alias, 3) }
    end

    trait :with_parent do
      parent { build(:place_alias_type) }
    end

    trait :with_children do
      children { build_list(:place_alias_type, 3) }
    end
  end
end
