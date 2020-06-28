# frozen_string_literal: true

require "active_brainz"

namespace :active_brainz do
  namespace :schema do
    desc "Creates a db/schema.rb file that is portable against any DB supported by Active Record"
    task :dump do
      ActiveBrainz::Database.connect!

      File.open(ActiveBrainz.root.join("db/schema.rb"), "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end
end
