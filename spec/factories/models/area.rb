# frozen_string_literal: true

FactoryBot.define do
  factory :area, class: "ActiveBrainz::Area" do
    gid { FFaker::Guid.guid }

    # association :area_type

    name { FFaker::Lorem.word }
    comment { FFaker::Lorem.word }

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

    edits_pending { FFaker::Lorem.word }
    last_updated { FFaker::Time.datetime }

    trait :with_artists do
      area_artists { build_list(:artist, 3) }
    end

    trait :with_begin_area_artists do
      begin_area_artists { build_list(:artist, 3) }
    end

    trait :with_end_area_artists do
      end_area_artists { build_list(:artist, 3) }
    end
  end
end
