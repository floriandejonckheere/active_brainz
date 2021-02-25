# frozen_string_literal: true

FactoryBot.define do
  factory :label_type, class: "ActiveBrainz::LabelType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_labels do
      labels { build_list(:label, 3) }
    end

    trait :with_parent do
      parent { build(:label_type) }
    end

    trait :with_children do
      children { build_list(:label_type, 3) }
    end
  end
end
