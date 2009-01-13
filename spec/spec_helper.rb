require "rubygems"
require "spec" # Satisfies Autotest and anyone else not using the Rake tasks

require File.dirname(__FILE__) + '/../lib/couchrest'

unless defined?(FIXTURE_PATH)
  FIXTURE_PATH = File.dirname(__FILE__) + '/fixtures' 
  SCRATCH_PATH = File.dirname(__FILE__) + '/tmp'

  COUCHHOST = "http://127.0.0.1:5984"
  TESTDB = 'couchrest-test'
end

def reset_test_db!
  cr = CouchRest.new(COUCHHOST)
  db = cr.database(TESTDB)
  db.delete! rescue nil
  db = cr.create_db(TESTDB) rescue nin
  db
end