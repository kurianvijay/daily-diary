feature 'user can updates entry' do
  scenario 'user updates entry' do
    visit("/update-entry?id=1")
    fill_in('title', :with => 'Updated title')
    fill_in('body', :with => 'Updated body')
    click_button("Save")
    expect(page).to have_content("Updated title")
    expect(page).to have_content("Updated body")
  end
end
