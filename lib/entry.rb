require_relative 'postgresql_manager'
require_relative 'comment'
require_relative 'tag'

class Entry

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

  attr_reader :id, :title, :body

  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def comments
    query = "SELECT * FROM Comments WHERE entry_id=#{@id};"
    PostgresqlManager.connect.exec(query).map { |row| Comment.new(id: row['id'], body: row['body'], entry_id: row['entry_id']) }
  end

  def tags
    query = "SELECT t.id, t.name "\
            "FROM EntryTags et "\
            "INNER JOIN Tags t ON t.id = et.tag_id "\
            "WHERE et.entry_id = #{@id};"
    PostgresqlManager.connect.exec(query).map { |row| Tag.new(id: row['id'], name: row['name']) }
  end

end
