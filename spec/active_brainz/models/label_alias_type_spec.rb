# frozen_string_literal: true

RSpec.describe ActiveBrainz::LabelAliasType, type: :model do
  subject(:label_alias_type) { build(:label_alias_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  it { is_expected.to have_many :label_aliases }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
end
