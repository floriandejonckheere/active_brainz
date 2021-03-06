# frozen_string_literal: true

RSpec.describe ActiveBrainz::LabelType, type: :model do
  subject(:label_type) { build(:label_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :labels }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
