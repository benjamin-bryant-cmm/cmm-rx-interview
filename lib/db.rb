require "sqlite3"

module Db
  DIR = File.expand_path("../db", __dir__)

  # Builds an in-memory database from schema, migrations, then seed.
  def self.connect
    conn = SQLite3::Database.new(":memory:", results_as_hash: true)
    conn.execute_batch(File.read(File.join(DIR, "schema.sql")))
    Dir[File.join(DIR, "migrations", "*.sql")].sort.each { |f| conn.execute_batch(File.read(f)) }
    conn.execute_batch(File.read(File.join(DIR, "seed.sql")))
    conn
  end
end
