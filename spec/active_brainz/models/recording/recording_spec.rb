# frozen_string_literal: true

RSpec.describe ActiveBrainz::Recording, type: :model do
  subject(:recording) { build(:recording) }

  it_behaves_like "it has a GID"

  it { is_expected.to belong_to(:recording_artist_credit).optional }
  # it { is_expected.to have_many :edit_recordings }
  # it { is_expected.to have_many :editor_collection_recordings }
  # it { is_expected.to have_many :isrcs }
  # it { is_expected.to have_many :recording_aliases }
  # it { is_expected.to have_many :recording_annotations }
  # it { is_expected.to have_many :recording_attributes }
  # it { is_expected.to have_many :recording_first_release_dates }
  # it { is_expected.to have_many :recording_gid_redirects }
  # it { is_expected.to have_many :recording_meta }
  # it { is_expected.to have_many :recording_rating_raws }
  # it { is_expected.to have_many :recording_tag_raws }
  # it { is_expected.to have_many :recording_tags }
  it { is_expected.to have_many :tracks }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }
  it { is_expected.to respond_to :length }
  it { is_expected.to respond_to :video }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
