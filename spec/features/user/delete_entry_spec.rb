feature 'user can delete entry' do
  scenario 'user clicks on delete button for entry and entry is deleted' do
    entry = add_entry
    visit('/')
    click_link("delete_entry_#{entry.id}")
    expect(page).not_to have_link("delete_entry_#{entry.id}")
  end
end
