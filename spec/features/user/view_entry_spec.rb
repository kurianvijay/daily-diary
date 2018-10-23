feature 'get one entry' do
  scenario 'user selects an entry and is displayed shown the entry title and body' do
    entry = add_entry
    visit('/')
    click_link("entry_#{entry.id}")
    expect(page).to have_content(entry.title)
  end
end
