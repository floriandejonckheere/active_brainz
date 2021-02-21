# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistCredit, type: :model do
  subject(:artist_credit) { build(:artist_credit) }

  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :artist_count }
  it { is_expected.to respond_to :created }
  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :ref_count }
end
