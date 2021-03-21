# frozen_string_literal: true

module ActiveBrainz
  class ISO31662 < Base
    self.table_name = "iso_3166_2"
    self.primary_key = "code"

    belongs_to :iso_3166_2_area,
               class_name: "Area",
               foreign_key: "area",
               optional: true
  end
end

# == Schema Information
#
# Table name: iso_3166_2
#
#  area :integer          not null
#  code :string(10)       not null, primary key
#
# Indexes
#
#  iso_3166_2_idx_area  (area)
#
# Foreign Keys
#
#  iso_3166_2_fk_area  (area => area.id)
#
