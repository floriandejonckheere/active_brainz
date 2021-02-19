# frozen_string_literal: true

RSpec.describe ActiveBrainz::Gender, type: :model do
  subject(:gender) { build(:gender) }

  it_behaves_like "it has a GID"

  it { is_expected.to have_many :gender_artists }
  it { is_expected.to have_many :gender_children }
  it { is_expected.to belong_to(:gender_parent).optional }

  it { is_expected.to respond_to :child_order }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :name }
end
