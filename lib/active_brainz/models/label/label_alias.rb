# frozen_string_literal: true

module ActiveBrainz
  class LabelAlias < Base
    self.table_name = "label_alias"

    include HasBeginEndDate

    belongs_to :label_alias_label,
               class_name: "Label",
               foreign_key: "label",
               optional: true

    belongs_to :label_alias_type,
               class_name: "LabelAliasType",
               foreign_key: "type",
               optional: true

    attribute :name
    attribute :sort_name

    attribute :locale
    attribute :primary_for_locale, :boolean

    attribute :edits_pending, :integer
    attribute :last_updated, :datetime
  end
end

# == Schema Information
#
# Table name: label_alias
#
#  id                 :integer          not null, primary key
#  begin_date_day     :integer
#  begin_date_month   :integer
#  begin_date_year    :integer
#  edits_pending      :integer          default(0), not null
#  end_date_day       :integer
#  end_date_month     :integer
#  end_date_year      :integer
#  ended              :boolean          default(FALSE), not null
#  label              :integer          not null
#  last_updated       :datetime
#  locale             :text
#  name               :string           not null
#  primary_for_locale :boolean          default(FALSE), not null
#  sort_name          :string           not null
#  type               :integer
#
# Indexes
#
#  label_alias_idx_label     (label)
#  label_alias_idx_primary   (label,locale) UNIQUE WHERE ((primary_for_locale = true) AND (locale IS NOT NULL))
#  label_alias_idx_txt       (mb_simple_tsvector((name)::text)) USING gin
#  label_alias_idx_txt_sort  (mb_simple_tsvector((sort_name)::text)) USING gin
#
# Foreign Keys
#
#  label_alias_fk_label  (label => label.id)
#  label_alias_fk_type   (type => label_alias_type.id)
#
