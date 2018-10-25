class Comment

  def self.create(body, entry_id)
    query = "INSERT INTO Comments(body, entry_id) VALUES('#{body}', '#{entry_id}') RETURNING id, body, entry_id;"
    initialize((PostgresqlManager.query(query))[0])
  end

  def self.initialize(rs)
    Comment.new(id: rs['id'], body: rs['body'], entry_id: rs['entry_id'])
  end

  attr_reader :id, :body, :entry_id

  def initialize(id:, body:, entry_id:)
   @id = id
   @body = body
   @entry_id = entry_id
  end

end
