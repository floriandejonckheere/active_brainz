# frozen_string_literal: true

FactoryBot.define do
  factory :area_area, class: "ActiveBrainz::AreaArea" do
    association :area_area_link, factory: :link

    association :area0, factory: :area
    association :area1, factory: :area

    entity0_credit { FFaker::Lorem.word }
    entity1_credit { FFaker::Lorem.word }

    link_order { FFaker::Random.rand(10) }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }
  end
end
