# frozen_string_literal: true

FactoryBot.define do
  factory :place_type, class: "ActiveBrainz::PlaceType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_places do
      places { build_list(:place, 3) }
    end

    trait :with_parent do
      parent { build(:place_type) }
    end

    trait :with_children do
      children { build_list(:place_type, 3) }
    end
  end
end
