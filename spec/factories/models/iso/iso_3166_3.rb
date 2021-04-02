# frozen_string_literal: true

FactoryBot.define do
  factory :iso_3166_3, class: "ActiveBrainz::ISO31663" do
    initialize_with { ActiveBrainz::ISO31663.find_or_initialize_by(code: code) }

    code { FFaker::Product.letters(4) }

    trait :with_area do
      association :iso_3166_1_area, factory: :area
    end
  end
end
