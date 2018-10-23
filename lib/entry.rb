require 'pg'

class Entry

  attr_reader :title, :body

  def initialize(title:, body:)
    @title = title
    @body = body
  end

  def self.create(title:, body:)
    db_connect
    @con.exec "INSERT INTO Entries(Title, Body) VALUES('#{title}', '#{body}');"
    rs = @con.exec "SELECT currval('entries_id_seq');"
    initialize(rs[0])
  end

  def self.get(id)
    db_connect
    rs = @con.exec "SELECT * FROM Entries WHERE Id=#{id} LIMIT 1"
    initialize(rs[0])
  end

  def self.all
    db_connect
    rs = @con.exec "SELECT * FROM Entries;"
    rs.map { |row| initialize(row) }
  end


  def self.update(id, updates)
  end

  def self.delete(id)
  end

  def self.initialize(rs)
    Entry.new(title: rs['title'], body: rs['body'])
  end

  def self.db_connect
    # begin
        @con = PG.connect :dbname => 'diary', :user => 'toddlangford-archer'
    #     puts con.server_version
    # rescue PG::Error => e
    #     puts e.message
    # ensure
    #     con.close if con
    # end
    # con ||= nil
  end

end
