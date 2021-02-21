# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistCredit, type: :model do
  subject(:artist_credit) { build(:artist_credit) }

  # it { is_expected.to have_many :alternative_releases }
  # it { is_expected.to have_many :alternative_tracks }
  it { is_expected.to have_many :artist_credit_names }
  # it { is_expected.to have_many :recordings }
  # it { is_expected.to have_many :release_groups }
  # it { is_expected.to have_many :releases }
  # it { is_expected.to have_many :tracks }

  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :artist_count }
  it { is_expected.to respond_to :ref_count }

  it { is_expected.to respond_to :created }
end
