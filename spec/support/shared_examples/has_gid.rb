# frozen_string_literal: true

RSpec.shared_examples "it has a GID" do
  it { is_expected.to validate_presence_of :gid }
  it { is_expected.to validate_uniqueness_of :gid }
end
