# frozen_string_literal: true

FactoryBot.define do
  factory :gender, class: "ActiveBrainz::Gender" do
    gid { FFaker::Guid.guid }

    child_order { FFaker::Lorem.word }
    description { FFaker::Lorem.word }
    name { FFaker::Lorem.word }

    trait :with_artists do
      gender_artists { build_list(:gender_artist, 3) }
    end

    trait :with_parent do
      association :gender_parent, factory: :gender
    end

    trait :with_children do
      gender_children { build_list(:gender, 3) }
    end
  end
end
