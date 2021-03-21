# frozen_string_literal: true

FactoryBot.define do
  factory :iso_3166_2, class: "ActiveBrainz::ISO31662" do
    code { FFaker::Product.letters(2) }

    trait :with_area do
      association :iso_3166_1_area, factory: :area
    end
  end
end
