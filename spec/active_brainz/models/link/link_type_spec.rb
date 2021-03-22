# frozen_string_literal: true

RSpec.describe ActiveBrainz::LinkType, type: :model do
  subject(:link_type) { build(:link_type) }

  it_behaves_like "it has a GID"
  it_behaves_like "it has a parent and children"

  # it { is_expected.to have_many :link_type_attribute_types }
  it { is_expected.to have_many :links }
  # it { is_expected.to have_many :orderable_link_types }

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :last_updated }
  it { is_expected.to respond_to :has_dates }
  it { is_expected.to respond_to :is_deprecated }
  it { is_expected.to respond_to :entity0_cardinality }
  it { is_expected.to respond_to :entity1_cardinality }
  it { is_expected.to respond_to :priority }
  it { is_expected.to respond_to :entity_type0 }
  it { is_expected.to respond_to :entity_type1 }
  it { is_expected.to respond_to :link_phrase }
  it { is_expected.to respond_to :long_link_phrase }
  it { is_expected.to respond_to :reverse_link_phrase }
end
