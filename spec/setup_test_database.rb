require 'postgresql_manager'

def setup_test_database
  p "Setting up test database..."
  # connection = PG.connect(dbname: 'diary_test')
  truncate = "TRUNCATE Comments, Entries;"
  add_entries = "INSERT INTO Entries(id, title, body)"\
                "VALUES"\
                "('1', 'First Entry', 'Test first body'),"\
                "('2', 'Second Entry', 'Test second Body'),"\
                "('3', 'Third Entry', 'Test third Body');"
  add_comments = "INSERT INTO Comments(id, body, entry_id)"\
                "VALUES"\
                "('1', 'Fist comment', 1),"\
                "('2', 'Second comment', 1),"\
                "('3', 'Third comment', 1);"
  query = truncate + add_entries + add_comments
  PostgresqlManager.connect.exec(query)

end
