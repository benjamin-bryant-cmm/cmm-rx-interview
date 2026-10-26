require "irb"
require "tzinfo"
require_relative "lib/api"
require_relative "lib/db"
require_relative "lib/refills"

# In-memory database built from db/schema.sql, db/migrations/, and db/seed.sql.
def conn
  $conn ||= Db.connect
end

# Reloads lib/*.rb and rebuilds the database from db/.
def reload!
  verbose, $VERBOSE = $VERBOSE, nil
  Dir[File.join(__dir__, "lib", "*.rb")].sort.each { |file| load file }
  $conn = Db.connect
  true
ensure
  $VERBOSE = verbose
end

puts <<~BANNER
  refill-api irb
    conn      SQLite3 database (rows come back as hashes)
    reload!   reload lib/*.rb and rebuild conn from db/
    Api, Refills, Db, TZInfo are loaded.

  Example: conn.execute("SELECT * FROM pharmacies")

BANNER

IRB.start(__FILE__)
