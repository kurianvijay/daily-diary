feature 'catagorising entries' do

  scenario 'adding multiple tags to a new entry' do
    visit '/new-entry'
    fill_in('title', :with => 'Test title')
    fill_in('body', :with => 'Test body')
    click_button('Save')
    expect(page).to have_content('Test title')
  end

end
