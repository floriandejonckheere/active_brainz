# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.collapse("lib/active_brainz/models")
loader.setup

module ActiveBrainz
  def self.root
    @root ||= Pathname.new(File.expand_path(File.join("..", ".."), __FILE__))
  end
end

require "active_record"

unless ActiveRecord::Base.configurations.any?
  ActiveRecord::Base.configurations = YAML.load_file(ActiveBrainz.root.join("config/database.yml"))
end

loader.eager_load
