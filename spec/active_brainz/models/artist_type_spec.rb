# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistType, type: :model do
  subject(:artist_type) { build(:artist_type) }

  it_behaves_like "it has a GID"

  it { is_expected.to have_many :artist_type_artists }
  it { is_expected.to have_many :artist_type_children }
  it { is_expected.to belong_to(:artist_type_parent).optional }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }

  it { is_expected.to respond_to :child_order }
end
