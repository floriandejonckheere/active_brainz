# frozen_string_literal: true

RSpec.describe ActiveBrainz::AreaArea, type: :model do
  subject(:area_area) { build(:area_area) }

  it { is_expected.to belong_to(:area_area_link).optional }

  it { is_expected.to belong_to :area0 }
  it { is_expected.to belong_to :area1 }

  it { is_expected.to respond_to :entity0_credit }
  it { is_expected.to respond_to :entity1_credit }

  it { is_expected.to respond_to :link_order }

  it { is_expected.to respond_to :edits_pending }
  it { is_expected.to respond_to :last_updated }
end
