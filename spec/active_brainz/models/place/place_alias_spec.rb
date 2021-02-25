# frozen_string_literal: true

RSpec.describe ActiveBrainz::PlaceAlias, type: :model do
  subject(:place_alias) { build(:place_alias) }

  it_behaves_like "it has a begin and end date"

  it { is_expected.to belong_to(:place_alias_place).optional }
  it { is_expected.to belong_to(:place_alias_type).optional }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :sort_name }

  it { is_expected.to respond_to :locale }
  it { is_expected.to respond_to :primary_for_locale }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
