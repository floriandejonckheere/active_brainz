# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module ActiveBrainz
  def self.root
    @root ||= Pathname.new(File.expand_path(File.join("..", ".."), __FILE__))
  end
end

loader.eager_load
