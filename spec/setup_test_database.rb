require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'diary_test')
  # Clear the bookmarks table
  # connection.exec("TRUNCATE Comments;")
  connection.exec("TRUNCATE Comments, Entries;")
end
