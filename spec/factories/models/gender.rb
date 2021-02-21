# frozen_string_literal: true

FactoryBot.define do
  factory :gender, class: "ActiveBrainz::Gender" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)

    trait :with_artists do
      artists { build_list(:artist, 3) }
    end

    # trait :with_editors do
    #   editors { build_list(:editor, 3) }
    # end

    trait :with_parent do
      parent { build(:gender) }
    end

    trait :with_children do
      children { build_list(:gender, 3) }
    end
  end
end
