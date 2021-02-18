# frozen_string_literal: true

FactoryBot.define do
  factory :artist_type, class: "ActiveBrainz::ArtistType" do
    gid { FFaker::Guid.guid }

    artist_type_artists { build_list(:artist, 3) }

    artist_type_parents { build_list(:artist_type, 3) }
    artist_type_parent { build(:artist_type) }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }

    sequence(:child_order)
  end
end
