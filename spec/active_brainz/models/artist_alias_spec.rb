# frozen_string_literal: true

RSpec.describe ActiveBrainz::ArtistAlias, type: :model do
  subject(:artist_alias) { build(:artist_alias) }

  it_behaves_like "it has a begin and end date"

  it { is_expected.to belong_to(:artist_alias_artist).optional }
  it { is_expected.to belong_to(:artist_alias_type).optional }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :sort_name }

  it { is_expected.to respond_to :locale }
  it { is_expected.to respond_to :primary_for_locale }

  it { is_expected.to respond_to :ended }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
