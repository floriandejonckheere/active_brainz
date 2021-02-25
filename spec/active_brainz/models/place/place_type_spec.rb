# frozen_string_literal: true

RSpec.describe ActiveBrainz::PlaceType, type: :model do
  subject(:place_type) { build(:place_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :places }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
