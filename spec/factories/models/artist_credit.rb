# frozen_string_literal: true

FactoryBot.define do
  factory :artist_credit, class: "ActiveBrainz::ArtistCredit" do
    name { FFaker::Lorem.word }

    artist_count { FFaker::Lorem.word }
    created { FFaker::Lorem.word }
    edits_pending { FFaker::Lorem.word }
    ref_count { FFaker::Lorem.word }
  end
end
