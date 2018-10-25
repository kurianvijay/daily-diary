require 'pg'

class PostgresqlManager

  attr_reader :connection

  def initialize(database)
    @connection = PG.connect :dbname => database
  end

  # def initialize(host, database, user, port)
  #   @connection = PG::Connection.open(:host => host, :dbname => database, :user => user, :port => port)
  # end

  def self.connect
    database = ENV['RACK_ENV'] == 'test' ? 'diary_test' : 'diary'
    # database = 'diary_test'
    instance = PostgresqlManager.new(database)
    instance.connection
  end

end
