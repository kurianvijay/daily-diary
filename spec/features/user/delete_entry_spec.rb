feature 'user can delete entry' do
  scenario 'user clicks on delete button for entry and entry is deleted' do
    visit('/')
    click_link("delete_entry_1")
    expect(page).not_to have_link("delete_entry_1")
  end
end
