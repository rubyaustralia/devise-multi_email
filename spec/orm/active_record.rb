ActiveRecord::Migration.verbose = false

migration_path = File.expand_path('../../rails_app/db/migrate/', __FILE__)
ActiveRecord::MigrationContext.new(migration_path).migrate
