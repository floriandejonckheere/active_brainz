# frozen_string_literal: true

FactoryBot.define do
  factory :artist_alias, class: "ActiveBrainz::ArtistAlias" do
    association :artist_alias_type, factory: :artist_alias_type

    name { FFaker::Lorem.word }
    sort_name { FFaker::Lorem.word }

    primary_for_locale { FFaker::Lorem.word }
    locale { FFaker::Lorem.word }

    edits_pending { FFaker::Lorem.word }
    last_updated { FFaker::Lorem.word }

    transient do
      begin_date { [FFaker::Time.date, nil].sample }
    end

    begin_date_year { begin_date&.year }
    begin_date_month { begin_date&.month }
    begin_date_day { begin_date&.day }

    transient do
      end_date { [FFaker::Time.date, nil].sample }
    end

    end_date_year { end_date&.year }
    end_date_month { end_date&.month }
    end_date_day { end_date&.day }

    ended { end_date.present? }

    trait :with_artist do
      artist_alias_artist { build(:artist) }
    end
  end
end
