# frozen_string_literal: true

FactoryBot.define do
  factory :release_group, class: "ActiveBrainz::ReleaseGroup" do
    gid { FFaker::Guid.guid }

    association :release_group_artist_credit, factory: :artist_credit
    # association :release_group_primary_type, factory: :release_group_primary_type

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }

    edits_pending { FFaker::Random.rand(10) }
    last_updated { FFaker::Time.datetime }

    # trait :with_edit_release_groups do
    #   edit_release_groups { build_list(:edit_release_group, 3) }
    # end

    # trait :with_editor_collection_release_groups do
    #   editor_collection_release_groups { build_list(:editor_collection_release_group, 3) }
    # end

    # trait :with_release_group_aliases do
    #   release_group_aliases { build_list(:release_group_alias, 3) }
    # end

    # trait :with_release_group_annotations do
    #   release_group_annotations { build_list(:release_group_annotation, 3) }
    # end

    # trait :with_release_group_attributes do
    #   release_group_attributes { build_list(:release_group_attribute, 3) }
    # end

    # trait :with_release_group_gid_redirects do
    #   release_group_gid_redirects { build_list(:release_group_gid_redirect, 3) }
    # end

    # trait :with_release_group_meta do
    #   release_group_meta { build_list(:release_group_meta, 3) }
    # end

    # trait :with_release_group_rating_raws do
    #   release_group_rating_raws { build_list(:release_group_rating_raw, 3) }
    # end

    # trait :with_release_group_secondary_type_joins do
    #   release_group_secondary_type_joins { build_list(:release_group_secondary_type_join, 3) }
    # end

    # trait :with_release_group_tag_raws do
    #   release_group_tag_raws { build_list(:release_group_tag_raw, 3) }
    # end

    # trait :with_release_group_tags do
    #   release_group_tags { build_list(:release_group_tag, 3) }
    # end

    # trait :with_releases do
    #   releases { build_list(:release, 3) }
    # end
  end
end
