# frozen_string_literal: true

FactoryBot.define do
  factory :link_type, class: "ActiveBrainz::LinkType" do
    gid { FFaker::Guid.guid }

    name { FFaker::Name.name }
    description { FFaker::Lorem.sentence }
    last_updated { FFaker::Time.datetime }
    has_dates { [true, false].sample }
    is_deprecated { [true, false].sample }
    entity0_cardinality { FFaker::Random.rand(10) }
    entity1_cardinality { FFaker::Random.rand(10) }
    priority { FFaker::Random.rand(10) }
    entity_type0 { FFaker::Lorem.word }
    entity_type1 { FFaker::Lorem.word }
    link_phrase { FFaker::Lorem.word }
    long_link_phrase { FFaker::Lorem.word }
    reverse_link_phrase { FFaker::Lorem.word }

    sequence(:child_order)

    # trait :with_link_type_attribute_types do
    #   link_type_attribute_types { build_list(:link_type_attribute_type, 3) }
    # end

    trait :with_links do
      links { build_list(:link, 3) }
    end

    # trait :with_orderable_link_types do
    #   orderable_link_types { build_list(:orderable_link_type, 3) }
    # end

    trait :with_parent do
      parent { build(:link_type) }
    end

    trait :with_children do
      children { build_list(:link_type, 3) }
    end
  end
end
