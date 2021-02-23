# frozen_string_literal: true

RSpec.describe ActiveBrainz::ReleaseGroup, type: :model do
  subject(:release_group) { build(:release_group) }

  it_behaves_like "it has a GID"

  it { is_expected.to belong_to(:release_group_artist_credit).optional }
  # it { is_expected.to belong_to(:release_group_primary_type).optional }
  # it { is_expected.to have_many :edit_release_groups }
  # it { is_expected.to have_many :editor_collection_release_groups }
  # it { is_expected.to have_many :release_group_aliases }
  # it { is_expected.to have_many :release_group_annotations }
  # it { is_expected.to have_many :release_group_attributes }
  # it { is_expected.to have_many :release_group_gid_redirects }
  # it { is_expected.to have_many :release_group_meta }
  # it { is_expected.to have_many :release_group_rating_raws }
  # it { is_expected.to have_many :release_group_secondary_type_joins }
  # it { is_expected.to have_many :release_group_tag_raws }
  # it { is_expected.to have_many :release_group_tags }
  it { is_expected.to have_many :releases }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
