# frozen_string_literal: true

RSpec.describe ActiveBrainz::Area, type: :model do
  subject(:area) { build(:area) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  it { is_expected.to belong_to(:area_type).optional }
  # it { is_expected.to have_many :area_aliases }
  # it { is_expected.to have_many :area_annotations }
  # it { is_expected.to have_many :area_attributes }
  # it { is_expected.to have_many :area_tag_raws }
  # it { is_expected.to have_many :area_tags }
  it { is_expected.to have_many :area_artists }
  it { is_expected.to have_many :begin_area_artists }
  it { is_expected.to have_many :end_area_artists }
  # it { is_expected.to have_many :area_country_areas }
  # it { is_expected.to have_many :area_edit_areas }
  # it { is_expected.to have_many :area_editor_collection_areas }
  # it { is_expected.to have_many :area_editors }
  it { is_expected.to have_one :area_iso_3166_1 }
  it { is_expected.to have_one :area_iso_3166_2 }
  it { is_expected.to have_one :area_iso_3166_3 }
  it { is_expected.to have_many :area_labels }
  # it { is_expected.to have_many :area_new_ids }
  # it { is_expected.to have_many :area_places }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
