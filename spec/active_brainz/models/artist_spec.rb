# frozen_string_literal: true

RSpec.describe ActiveBrainz::Artist, type: :model do
  subject(:artist) { build(:artist) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a begin and end date"

  # it { is_expected.to belong_to(:artist_area).class_name("Area").optional }
  # it { is_expected.to belong_to(:artist_begin_area).class_name("Area").optional }
  # it { is_expected.to belong_to(:artist_end_area).class_name("Area").optional }
  it { is_expected.to belong_to(:artist_type).class_name("ArtistType").optional }
  # it { is_expected.to belong_to(:artist_gender).class_name("Gender").optional }

  it { is_expected.to respond_to :name, :sort_name }
  it { is_expected.to respond_to :comment, :edits_pending, :last_updated }
end
