# frozen_string_literal: true

RSpec.shared_examples "it has a begin and end date" do
  it { is_expected.to respond_to :begin_date_year, :begin_date_month, :begin_date_day }
  it { is_expected.to respond_to :end_date_year, :end_date_month, :end_date_day }
  it { is_expected.to respond_to :ended }

  describe "#begin_date" do
    it "returns a complete date" do
      model = build(model_name, begin_date_year: 1992, begin_date_month: 7, begin_date_day: 2)

      expect(model.begin_date).to eq Date.new(1992, 7, 2)
    end

    it "returns a date without day" do
      model = build(model_name, begin_date_year: 1992, begin_date_month: 7, begin_date_day: nil)

      expect(model.begin_date).to eq Date.new(1992, 7, 1)
    end

    it "returns a date without month or day" do
      model = build(model_name, begin_date_year: 1992, begin_date_month: nil, begin_date_day: nil)

      expect(model.begin_date).to eq Date.new(1992, 1, 1)
    end

    it "returns nil" do
      model = build(model_name, begin_date_year: nil, begin_date_month: nil, begin_date_day: nil)

      expect(model.begin_date).to be_nil
    end
  end

  describe "#end_date" do
    it "returns a complete date" do
      model = build(model_name, end_date_year: 1992, end_date_month: 7, end_date_day: 2)

      expect(model.end_date).to eq Date.new(1992, 7, 2)
    end

    it "returns a date without day" do
      model = build(model_name, end_date_year: 1992, end_date_month: 7, end_date_day: nil)

      expect(model.end_date).to eq Date.new(1992, 7, 1)
    end

    it "returns a date without month or day" do
      model = build(model_name, end_date_year: 1992, end_date_month: nil, end_date_day: nil)

      expect(model.end_date).to eq Date.new(1992, 1, 1)
    end

    it "returns nil" do
      model = build(model_name, end_date_year: nil, end_date_month: nil, end_date_day: nil)

      expect(model.end_date).to be_nil
    end
  end

  def model_name
    described_class.name.demodulize.underscore
  end
end
