# frozen_string_literal: true

RSpec.describe ActiveBrainz::Area, type: :model do
  subject(:area) { build(:area) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  it { is_expected.to have_many :area_artists }
  it { is_expected.to have_many :begin_area_artists }
  it { is_expected.to have_many :end_area_artists }
  # it { is_expected.to belong_to(:area_type).optional }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }
  it { is_expected.to respond_to :ended }
  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
