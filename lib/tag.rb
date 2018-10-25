class Tag

  def self.create(name:)
    query = "INSERT INTO Tags(name) VALUES('#{name}') RETURNING id, name;"
    initialize((PostgresqlManager.connect.exec(query))[0])
  end

  def self.all
    query = "SELECT * FROM Tags ORDER BY id;"
    PostgresqlManager.connect.exec(query).map { |row| initialize(row) }
  end

  def self.initialize(rs)
    Tag.new(id: rs['id'], name: rs['name'])
  end

  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

end
