# frozen_string_literal: true

FactoryBot.define do
  factory :iso_3166_2, class: "ActiveBrainz::ISO31662" do
    initialize_with { ActiveBrainz::ISO31662.find_or_initialize_by(code: code) }

    code { "#{FFaker::Product.letters(2)}-#{FFaker::Product.letters(2)}" }

    trait :with_area do
      association :iso_3166_1_area, factory: :area
    end
  end
end
