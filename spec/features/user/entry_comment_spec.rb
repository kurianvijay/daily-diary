feature 'user comment' do
  scenario 'user can add a comment to an existing entry' do
    entry = add_entry
    visit("/read?id=#{entry.id}")
    fill_in('new_comment', :with => 'This is a test comment')
    click_button('Save Comment')
    expect(page).to have_content('This is a test comment')
  end
end
