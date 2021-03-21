# frozen_string_literal: true

module ActiveBrainz
  class ISO31661 < Base
    self.table_name = "iso_3166_1"
    self.primary_key = "code"

    belongs_to :iso_3166_1_area,
               class_name: "Area",
               foreign_key: "area",
               optional: true
  end
end

# == Schema Information
#
# Table name: iso_3166_1
#
#  area :integer          not null
#  code :string(2)        not null, primary key
#
# Indexes
#
#  iso_3166_1_idx_area  (area)
#
# Foreign Keys
#
#  iso_3166_1_fk_area  (area => area.id)
#
