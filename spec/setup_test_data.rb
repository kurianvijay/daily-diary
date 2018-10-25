require 'postgresql_manager'

def setup_test_data

  truncate_database = "TRUNCATE EntryTags, Comments, Entries, Tags;"

  create_tags =       "INSERT INTO Tags(id, name)"\
                      "VALUES"\
                      "('1', 'Happy'),"\
                      "('2', 'Sad'),"\
                      "('3', 'Achievment'),"\
                      "('4', 'Regret'),"\
                      "('5', 'Sport'),"\
                      "('6', 'Love');"

  create_entries =    "INSERT INTO Entries(id, title, body)"\
                      "VALUES"\
                      "('1', 'First Entry', 'Test first body'),"\
                      "('2', 'Second Entry', 'Test second Body'),"\
                      "('3', 'Third Entry', 'Test third Body');"

  create_entry_tags = "INSERT INTO EntryTags(entry_id, tag_id)"\
                      "VALUES"\
                      "('1', '1'),"\
                      "('1', '2'),"\
                      "('1', '3');"

  create_comments =   "INSERT INTO Comments(id, body, entry_id)"\
                      "VALUES"\
                      "('1', 'Fist comment', 1),"\
                      "('2', 'Second comment', 1),"\
                      "('3', 'Third comment', 1);"

  q = truncate_database
  q += create_tags
  q += create_entries
  q += create_entry_tags
  q += create_comments

  PostgresqlManager.query(q)
end
