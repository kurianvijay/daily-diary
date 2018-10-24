require_relative 'postgresql_manager'

class Entry

  attr_reader :id, :title, :body

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def self.create(title:, body:)
    query = "INSERT INTO Entries(Title, Body) VALUES('#{title}', '#{body}') RETURNING id, title, body;"
    initialize((PostgresqlManager.connect.exec(query))[0])
  end

  def self.get(id)
    query = "SELECT * FROM Entries WHERE Id=#{id};"
    initialize((PostgresqlManager.connect.exec(query))[0])
  end

  def self.all
    query = "SELECT * FROM Entries ORDER BY id;"
    PostgresqlManager.connect.exec(query).map { |row| initialize(row) }
  end


  def self.update(id:, title:, body:)
    query = "UPDATE Entries SET title = '#{title}', body = '#{body}' WHERE Id=#{id};"
    PostgresqlManager.connect.exec(query)
    get(id)
  end

  def self.delete(id)
    PostgresqlManager.connect.exec "DELETE FROM Entries WHERE id=#{id};"
  end

  def self.initialize(rs)
    Entry.new(id: rs['id'], title: rs['title'], body: rs['body'])
  end

  # def self.db_connect
  #   # begin
  #       con = PostgresqlManager.connect
  #   #     puts con.server_version
  #   # rescue PG::Error => e
  #   #     puts e.message
  #   # ensure
  #   #     con.close if con
  #   # end
  #   # con ||= nil
  # end

  def comments
    query = "SELECT * FROM Comments WHERE entry_id=#{@id};"
    PostgresqlManager.connect.exec(query)
  end

end
