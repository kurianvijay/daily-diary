CREATE TABLE EntryTags(
  entry_id INTEGER REFERENCES Entries(id) ON DELETE CASCADE,
  tag_id INTEGER REFERENCES Tags(id) ON DELETE CASCADE,
  CONSTRAINT entry_tag_pkey PRIMARY KEY (entry_id, tag_id)
);
