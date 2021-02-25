# frozen_string_literal: true

RSpec.describe ActiveBrainz::Artist, type: :model do
  subject(:artist) { build(:artist) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  it { is_expected.to belong_to(:artist_area).optional }
  it { is_expected.to belong_to(:artist_type).optional }
  it { is_expected.to belong_to(:artist_begin_area).optional }
  it { is_expected.to belong_to(:artist_end_area).optional }
  it { is_expected.to belong_to(:artist_gender).optional }
  it { is_expected.to have_many :artist_aliases }
  # it { is_expected.to have_many :artist_annotations }
  # it { is_expected.to have_many :artist_attributes }
  it { is_expected.to have_many :artist_credit_names }
  # it { is_expected.to have_many :artist_ipis }
  # it { is_expected.to have_many :artist_isnis }
  # it { is_expected.to have_many :artist_meta }
  # it { is_expected.to have_many :artist_rating_raws }
  # it { is_expected.to have_many :artist_tag_raws }
  # it { is_expected.to have_many :artist_tags }
  # it { is_expected.to have_many :artist_edit_artists }
  # it { is_expected.to have_many :artist_editor_collection_artists }
  # it { is_expected.to have_many :artist_editor_subscribe_artists }
  # it { is_expected.to have_many :artist_editor_watch_artists }
  # it { is_expected.to have_many :artist_new_ids }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :sort_name }

  it { is_expected.to respond_to :ended }

  it { is_expected.to respond_to :comment }
  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
