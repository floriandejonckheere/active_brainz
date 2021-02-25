# frozen_string_literal: true

RSpec.describe ActiveBrainz::PlaceAliasType, type: :model do
  subject(:place_alias_type) { build(:place_alias_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :place_aliases }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
