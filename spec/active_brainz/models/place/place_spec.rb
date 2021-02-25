# frozen_string_literal: true

RSpec.describe ActiveBrainz::Place, type: :model do
  subject(:place) { build(:place) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  # it { is_expected.to have_many :edit_places }
  # it { is_expected.to have_many :editor_collection_places }
  it { is_expected.to have_many :place_aliases }
  # it { is_expected.to have_many :place_annotations }
  it { is_expected.to belong_to(:place_area).optional }
  # it { is_expected.to have_many :place_attributes }
  # it { is_expected.to have_many :place_gid_redirects }
  # it { is_expected.to have_many :place_tag_raws }
  # it { is_expected.to have_many :place_tags }
  it { is_expected.to belong_to(:place_type).optional }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }

  it { is_expected.to respond_to :coordinates }
  it { is_expected.to respond_to :address }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
