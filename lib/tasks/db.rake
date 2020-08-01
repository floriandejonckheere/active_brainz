# frozen_string_literal: true

require "active_brainz"

namespace :db do
  task :migrate
  task :rollback

  namespace :migrate do
    task :up
    task :down
    task :status
    task :reset
    task :redo
  end
end
