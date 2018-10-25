require 'entry'

def visit_new_entry_page_and_fill_in_title_and_body
  visit '/new-entry'
  fill_in('title', :with => 'Test title')
  fill_in('body', :with => 'Test body')
end

def add_tags_to_diary_entry
  choose('happy')
  choose('sport')
end
