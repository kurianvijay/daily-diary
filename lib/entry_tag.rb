class EntryTag

  def self.create(entry_id, tag_id)
    query = "INSERT INTO EntryTags(entry_id, tag_id) VALUES('#{entry_id}', '#{tag_id}') RETURNING entry_id, tag_id;"
    initialize((PostgresqlManager.connect.exec(query))[0])
  end

  def self.all
    query = "SELECT * FROM EntryTags;"
    PostgresqlManager.connect.exec(query).map { |row| initialize(row) }
  end

  def self.update(entry_id, tag_ids)
    query = "DELETE FROM EntryTags"\
              " WHERE entry_id=#{entry_id};"
    insert = "INSERT INTO EntryTags(entry_id, tag_id)"\
              " VALUES"\
              " #{tag_ids.map { |tag_id| "(#{entry_id}, #{tag_id})" }.join(', ')};"
    query += insert unless tag_ids.empty?
    PostgresqlManager.connect.exec(query)
  end

  def self.initialize(rs)
    EntryTag.new(rs['entry_id'], rs['tag_id'])
  end

  attr_reader :entry_id, :tag_id

  def initialize(entry_id, tag_id)
    @entry_id = entry_id
    @tag_id = tag_id
  end

end
