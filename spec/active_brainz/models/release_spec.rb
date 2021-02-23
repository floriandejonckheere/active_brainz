# frozen_string_literal: true

RSpec.describe ActiveBrainz::Release, type: :model do
  subject(:release) { build(:release) }

  it_behaves_like "it has a GID"

  it { is_expected.to belong_to(:release_artist_credit).optional }
  # it { is_expected.to belong_to(:release_language).optional }
  # it { is_expected.to belong_to(:release_packaging).optional }
  it { is_expected.to belong_to(:release_release_group).optional }
  # it { is_expected.to belong_to(:release_script).optional }
  # it { is_expected.to belong_to(:release_status).optional }
  # it { is_expected.to have_many :alternative_releases }
  # it { is_expected.to have_many :edit_releases }
  # it { is_expected.to have_many :editor_collection_releases }
  # it { is_expected.to have_many :media }
  # it { is_expected.to have_many :release_aliases }
  # it { is_expected.to have_many :release_annotations }
  # it { is_expected.to have_many :release_attributes }
  # it { is_expected.to have_many :release_countries }
  # it { is_expected.to have_many :release_coverarts }
  # it { is_expected.to have_many :release_first_release_dates }
  # it { is_expected.to have_many :release_gid_redirects }
  # it { is_expected.to have_many :release_labels }
  # it { is_expected.to have_many :release_meta }
  # it { is_expected.to have_many :release_tag_raws }
  # it { is_expected.to have_many :release_tags }
  # it { is_expected.to have_many :release_unknown_countries }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }

  it { is_expected.to respond_to :barcode }

  it { is_expected.to respond_to :quality }
  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
