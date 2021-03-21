# frozen_string_literal: true

RSpec.describe ActiveBrainz::ISO31661, type: :model do
  subject(:iso_3166_1) { build(:iso_3166_1) }

  it { is_expected.to belong_to(:iso_3166_1_area).optional }
end
