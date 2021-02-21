# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistCreditName, type: :model do
  subject(:artist_credit_name) { build(:artist_credit_name) }

  it { is_expected.to belong_to(:artist_credit_name_artist).optional }
  it { is_expected.to belong_to(:artist_credit_name_artist_credit).optional }

  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :join_phrase }
  it { is_expected.to respond_to :position }
end
