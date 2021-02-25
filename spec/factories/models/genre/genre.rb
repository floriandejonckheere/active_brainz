# frozen_string_literal: true

FactoryBot.define do
  factory :genre, class: "ActiveBrainz::Genre" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    trait :with_genre_aliases do
      genre_aliases { build_list(:genre_alias, 3) }
    end
  end
end
