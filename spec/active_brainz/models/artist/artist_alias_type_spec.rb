# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistAliasType, type: :model do
  subject(:artist_alias_type) { build(:artist_alias_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :artist_aliases }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
