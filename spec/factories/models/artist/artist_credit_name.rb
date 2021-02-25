# frozen_string_literal: true

FactoryBot.define do
  factory :artist_credit_name, class: "ActiveBrainz::ArtistCreditName" do
    sequence(:artist_credit)
    sequence(:position)

    association :artist_credit_name_artist, factory: :artist
    association :artist_credit_name_artist_credit, factory: :artist_credit

    name { FFaker::Lorem.word }

    join_phrase { FFaker::Lorem.word }
  end
end
