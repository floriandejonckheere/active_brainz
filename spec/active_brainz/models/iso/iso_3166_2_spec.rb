# frozen_string_literal: true

RSpec.describe ActiveBrainz::ISO31662, type: :model do
  subject(:iso_3166_2) { build(:iso_3166_2) }

  it { is_expected.to belong_to(:iso_3166_2_area).optional }
end
