# frozen_string_literal: true

RSpec.describe ActiveBrainz::Artist, type: :model do
  subject(:artist) { build(:artist) }

  it_behaves_like "it has a GID"

  # it { is_expected.to belong_to(:artist_area).class_name("Area").optional }
  # it { is_expected.to belong_to(:artist_begin_area).class_name("Area").optional }
  # it { is_expected.to belong_to(:artist_end_area).class_name("Area").optional }
  it { is_expected.to belong_to(:artist_type).class_name("ArtistType").optional }
  # it { is_expected.to belong_to(:artist_gender).class_name("Gender").optional }

  it { is_expected.to respond_to :name, :sort_name }
  it { is_expected.to respond_to :begin_date_year, :begin_date_month, :begin_date_day }
  it { is_expected.to respond_to :end_date_year, :end_date_month, :end_date_day }
  it { is_expected.to respond_to :comment, :edits_pending, :last_updated }

  describe "#begin_date" do
    it "returns a complete date" do
      artist = build(:artist, begin_date_year: 1992, begin_date_month: 7, begin_date_day: 2)

      expect(artist.begin_date).to eq Date.new(1992, 7, 2)
    end

    it "returns a date without day" do
      artist = build(:artist, begin_date_year: 1992, begin_date_month: 7, begin_date_day: nil)

      expect(artist.begin_date).to eq Date.new(1992, 7, 1)
    end

    it "returns a date without month or day" do
      artist = build(:artist, begin_date_year: 1992, begin_date_month: nil, begin_date_day: nil)

      expect(artist.begin_date).to eq Date.new(1992, 1, 1)
    end
  end

  describe "#end_date" do
    it "returns a complete date" do
      artist = build(:artist, end_date_year: 1992, end_date_month: 7, end_date_day: 2)

      expect(artist.end_date).to eq Date.new(1992, 7, 2)
    end

    it "returns a date without day" do
      artist = build(:artist, end_date_year: 1992, end_date_month: 7, end_date_day: nil)

      expect(artist.end_date).to eq Date.new(1992, 7, 1)
    end

    it "returns a date without month or day" do
      artist = build(:artist, end_date_year: 1992, end_date_month: nil, end_date_day: nil)

      expect(artist.end_date).to eq Date.new(1992, 1, 1)
    end
  end
end
