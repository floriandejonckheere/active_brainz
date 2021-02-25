# frozen_string_literal: true

RSpec.describe ActiveBrainz::Gender, type: :model do
  subject(:gender) { build(:gender) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :artists }
  # it { is_expected.to have_many :editors }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
