# frozen_string_literal: true

RSpec.shared_examples "it has a parent and children" do
  it { is_expected.to have_many :children }
  it { is_expected.to belong_to(:parent).optional }

  it { is_expected.to respond_to :child_order }
end
