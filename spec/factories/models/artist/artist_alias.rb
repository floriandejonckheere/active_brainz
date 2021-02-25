# frozen_string_literal: true

FactoryBot.define do
  factory :artist_alias, class: "ActiveBrainz::ArtistAlias" do
    association :artist_alias_artist, factory: :artist
    association :artist_alias_type, factory: :artist_alias_type

    name { FFaker::Name.name }
    sort_name { FFaker::Name.name }

    locale { FFaker::Locale.code }
    primary_for_locale { FFaker::Lorem.word }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

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
  end
end
