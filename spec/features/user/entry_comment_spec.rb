feature 'user comment' do
  scenario 'user can add a comment to an existing entry' do
    visit("/read?id=1")
    fill_in('body', :with => 'This is a test comment')
    click_button('Save Comment')
    expect(page).to have_content('This is a test comment')
  end
end
