require 'entry'

def add_entry
  # visit '/new-entry'
  # fill_in('title', :with => '22nd October 2018')
  # fill_in('body', :with => 'This is my first Diary entry')
  # click_button('Submit')
  Entry.create(title: '22nd October 2018', body: 'This is my first Diary entry')
end
