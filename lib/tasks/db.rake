# frozen_string_literal: true

require "active_support/all"
require "active_record/tasks/database_tasks"
require "activerecord/postgres_enum"

require "active_brainz"

namespace :db do
  include ActiveRecord::Tasks

  desc "Creates the database"
  task :create do
    DatabaseTasks.create :musicbrainz
  end

  desc "Drops the database"
  task :drop do
    DatabaseTasks.drop :musicbrainz
  end

  namespace :schema do
    desc "Recreates the databases from the schema.rb file"
    task :load do
      ActiveRecord::Base.establish_connection :musicbrainz

      require ActiveBrainz.root.join("db/schema")

      puts "Loaded schema for database '#{ActiveRecord::Base.connection.current_database}'"
    end

    desc "Dumps the database structure to db/schema.rb"
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
