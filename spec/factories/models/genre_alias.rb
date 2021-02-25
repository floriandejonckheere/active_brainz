# frozen_string_literal: true

FactoryBot.define do
  factory :genre_alias, class: "ActiveBrainz::GenreAlias" do
    association :genre_alias_genre, factory: :genre

    name { FFaker::Name.name }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    locale { FFaker::Locale.code }
    primary_for_locale { [true, false].sample }
  end
end
