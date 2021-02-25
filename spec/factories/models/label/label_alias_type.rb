# frozen_string_literal: true

FactoryBot.define do
  factory :label_alias_type, class: "ActiveBrainz::LabelAliasType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_label_aliases do
      label_aliases { build_list(:label_alias, 3) }
    end

    trait :with_parent do
      parent { build(:label_alias_type) }
    end

    trait :with_children do
      children { build_list(:label_alias_type, 3) }
    end
  end
end
