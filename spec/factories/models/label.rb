# frozen_string_literal: true

FactoryBot.define do
  factory :label, class: "ActiveBrainz::Label" do
    gid { FFaker::Guid.guid }

    association :label_area, factory: :area
    association :label_type, factory: :label_type

    name { FFaker::Name.name }
    comment { FFaker::Lorem.sentence }
    label_code { FFaker::Random.rand(10) }

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

    # trait :with_edit_labels do
    #   edit_labels { build_list(:edit_label, 3) }
    # end

    # trait :with_editor_collection_labels do
    #   editor_collection_labels { build_list(:editor_collection_label, 3) }
    # end

    # trait :with_editor_subscribe_labels do
    #   editor_subscribe_labels { build_list(:editor_subscribe_label, 3) }
    # end

    trait :with_label_aliases do
      label_aliases { build_list(:label_alias, 3) }
    end

    # trait :with_label_annotations do
    #   label_annotations { build_list(:label_annotation, 3) }
    # end

    # trait :with_label_attributes do
    #   label_attributes { build_list(:label_attribute, 3) }
    # end

    # trait :with_label_gid_redirects do
    #   label_gid_redirects { build_list(:label_gid_redirect, 3) }
    # end

    # trait :with_label_ipis do
    #   label_ipis { build_list(:label_ipi, 3) }
    # end

    # trait :with_label_isnis do
    #   label_isnis { build_list(:label_isni, 3) }
    # end

    # trait :with_label_meta do
    #   label_meta { build_list(:label_meta, 3) }
    # end

    # trait :with_label_rating_raws do
    #   label_rating_raws { build_list(:label_rating_raw, 3) }
    # end

    # trait :with_label_tag_raws do
    #   label_tag_raws { build_list(:label_tag_raw, 3) }
    # end

    # trait :with_label_tags do
    #   label_tags { build_list(:label_tag, 3) }
    # end

    # trait :with_release_labels do
    #   release_labels { build_list(:release_label, 3) }
    # end
  end
end
