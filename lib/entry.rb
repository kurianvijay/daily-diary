require 'pg'

class Entry

  attr_reader :id, :title, :body

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def self.create(title:, body:)
    db_connect
    query = "INSERT INTO Entries(Title, Body) VALUES('#{title}', '#{body}') RETURNING id, title, body;"
    initialize((@con.exec(query))[0])
  end

  def self.get(id)
    db_connect
    query = "SELECT * FROM Entries WHERE Id=#{id};"
    initialize((@con.exec(query))[0])
  end

  def self.all
    db_connect
    rs = @con.exec "SELECT * FROM Entries ORDER BY id;"
    rs.map { |row| initialize(row) }
  end


  def self.update(id:, title:, body:)
    db_connect
    query = "UPDATE Entries SET title = '#{title}', body = '#{body}' WHERE Id=#{id};"
    @con.exec(query)
    get(id)
  end

  def self.delete(id)
    db_connect
    @con.exec "DELETE FROM Entries WHERE id=#{id};"
  end

  def self.initialize(rs)
    Entry.new(id: rs['id'], title: rs['title'], body: rs['body'])
  end

  def self.db_connect
    # begin
        database = ENV['RACK_ENV'] == 'test' ? 'diary_test' : 'diary'
        @con = PG.connect :dbname => database
    #     puts con.server_version
    # rescue PG::Error => e
    #     puts e.message
    # ensure
    #     con.close if con
    # end
    # con ||= nil
  end

end
