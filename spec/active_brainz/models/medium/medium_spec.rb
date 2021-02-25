# frozen_string_literal: true

RSpec.describe ActiveBrainz::Medium, type: :model do
  subject(:medium) { build(:medium) }

  # it { is_expected.to belong_to(:medium_format).optional }
  it { is_expected.to belong_to(:medium_release).optional }
  # it { is_expected.to have_many :alternative_media }
  # it { is_expected.to have_many :medium_attributes }
  # it { is_expected.to have_many :medium_cdtocs }
  # it { is_expected.to have_many :medium_indices }
  it { is_expected.to have_many :tracks }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :position }
  it { is_expected.to respond_to :track_count }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
