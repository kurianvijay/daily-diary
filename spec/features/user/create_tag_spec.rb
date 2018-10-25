feature 'tags' do
  scenario 'user creates a tag' do
    visit '/create-tag'
    fill_in('name', :with => 'Happy')
    click_button('Save')
    expect(page).to have_content('Happy')
  end
end
