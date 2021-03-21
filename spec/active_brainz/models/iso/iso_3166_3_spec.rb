# frozen_string_literal: true

RSpec.describe ActiveBrainz::ISO31663, type: :model do
  subject(:iso_3166_3) { build(:iso_3166_3) }

  it { is_expected.to belong_to(:iso_3166_3_area).optional }
end
