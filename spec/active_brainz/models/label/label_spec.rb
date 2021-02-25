# frozen_string_literal: true

RSpec.describe ActiveBrainz::Label, type: :model do
  subject(:label) { build(:label) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  it { is_expected.to belong_to(:label_area).optional }
  it { is_expected.to belong_to(:label_type).optional }
  # it { is_expected.to have_many :edit_labels }
  # it { is_expected.to have_many :editor_collection_labels }
  # it { is_expected.to have_many :editor_subscribe_labels }
  it { is_expected.to have_many :label_aliases }
  # it { is_expected.to have_many :label_annotations }
  # it { is_expected.to have_many :label_attributes }
  # it { is_expected.to have_many :label_gid_redirects }
  # it { is_expected.to have_many :label_ipis }
  # it { is_expected.to have_many :label_isnis }
  # it { is_expected.to have_many :label_meta }
  # it { is_expected.to have_many :label_rating_raws }
  # it { is_expected.to have_many :label_tag_raws }
  # it { is_expected.to have_many :label_tags }
  # it { is_expected.to have_many :release_labels }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }
  it { is_expected.to respond_to :label_code }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
