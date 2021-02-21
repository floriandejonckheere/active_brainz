# frozen_string_literal: true

RSpec.describe ActiveBrainz::AreaType, type: :model do
  subject(:area_type) { build(:area_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :area_type_artists }

  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :name }
end
