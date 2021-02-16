# frozen_string_literal: true

require "active_brainz"

namespace :active_brainz do
  namespace :schema do
    desc "Creates a db/schema.rb file that is portable against any DB supported by Active Record"
    task :dump do
      # Add custom database types
      types = {
        enum: { name: "enum" },
        nil => { name: "nil" },
      }

      ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::NATIVE_DATABASE_TYPES.merge! types
      ActiveRecord::Base.establish_connection :musicbrainz

      File.open(ActiveBrainz.root.join("db/schema.rb"), "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end

      puts "Database schema dumped to db/schema.rb"
    end
  end
end
