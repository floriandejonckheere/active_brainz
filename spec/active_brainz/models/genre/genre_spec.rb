# frozen_string_literal: true

RSpec.describe ActiveBrainz::Genre, type: :model do
  subject(:genre) { build(:genre) }

  it_behaves_like "it has a GID"

  it { is_expected.to have_many :genre_aliases }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :comment }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
