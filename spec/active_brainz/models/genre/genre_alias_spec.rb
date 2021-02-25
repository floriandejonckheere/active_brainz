# frozen_string_literal: true

RSpec.describe ActiveBrainz::GenreAlias, type: :model do
  subject(:genre_alias) { build(:genre_alias) }

  it { is_expected.to belong_to(:genre_alias_genre).optional }

  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :locale }
  it { is_expected.to respond_to :primary_for_locale }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
