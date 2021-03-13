# frozen_string_literal: true

module ActiveBrainz
  module HasBeginEndDate
    extend ActiveSupport::Concern

    included do
      attribute :begin_date_year, :integer
      attribute :begin_date_month, :integer
      attribute :begin_date_day, :integer

      attribute :end_date_year, :integer
      attribute :end_date_month, :integer
      attribute :end_date_day, :integer

      attribute :ended, :boolean

      def begin_date
        @begin_date ||= Date.new(*[begin_date_year, begin_date_month, begin_date_day].compact) if begin_date_year
      end

      def end_date
        @end_date ||= Date.new(*[end_date_year, end_date_month, end_date_day].compact) if end_date_year
      end
    end
  end
end
