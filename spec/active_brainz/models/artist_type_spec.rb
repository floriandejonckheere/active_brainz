# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistType do
  subject(:artist_type) { build(:artist_type) }

  it_behaves_like "it has a GID"

  it { is_expected.to have_many :artist_type_artists }
  it { is_expected.to have_many :artist_type_children }
  it { is_expected.to belong_to(:artist_type_parent).optional }

  it { is_expected.to have_attributes :name }
  it { is_expected.to have_attributes :description }

  it { is_expected.to have_attributes :child_order }
end
