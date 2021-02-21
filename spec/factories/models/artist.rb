# frozen_string_literal: true

FactoryBot.define do
  factory :artist, class: "ActiveBrainz::Artist" do
    association :artist_area, factory: :area
    association :artist_begin_area, factory: :area
    association :artist_end_area, factory: :area

    association :artist_type, factory: :artist_type
    association :artist_gender, factory: :gender

    gid { FFaker::Guid.guid }
    name { FFaker::Name.name }
    sort_name { name }

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

    comment { FFaker::Lorem.sentence }
    edits_pending { FFaker::Random.rand(0..10) }
    last_updated { FFaker::Time.datetime }
  end
end
