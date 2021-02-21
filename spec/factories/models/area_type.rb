# frozen_string_literal: true

FactoryBot.define do
  factory :area_type, class: "ActiveBrainz::AreaType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_areas do
      area_type_areas { build_list(:area, 3) }
    end

    trait :with_parent do
      area_type_parent { build(:area_type) }
    end

    trait :with_children do
      area_type_children { build_list(:area_type, 3) }
    end
  end
end
