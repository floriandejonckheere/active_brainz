# frozen_string_literal: true

ActiveBrainz.loader.inflector = ActiveSupport::Inflector

ActiveSupport::Inflector.inflections do |inflect|
  inflect.acronym "GID"
  inflect.acronym "IPI"
  inflect.acronym "ISNI"
  inflect.acronym "ISO"
end
