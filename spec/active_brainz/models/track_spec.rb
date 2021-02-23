# frozen_string_literal: true

RSpec.describe ActiveBrainz::Track, type: :model do
  subject(:track) { build(:track) }

  it_behaves_like "it has a GID"

  it { is_expected.to belong_to(:track_artist_credit).optional }
  it { is_expected.to belong_to(:track_medium).optional }
  it { is_expected.to belong_to(:track_recording).optional }
  # it { is_expected.to have_many :alternative_medium_tracks }
  # it { is_expected.to have_many :track_gid_redirects }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :number }
  it { is_expected.to respond_to :length }
  it { is_expected.to respond_to :position }
  it { is_expected.to respond_to :is_data_track }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
