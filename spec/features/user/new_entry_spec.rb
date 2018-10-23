feature 'adding a diary entry' do
  scenario 'successfully add new diary entry and show entry log' do
    visit '/new-entry'
    fill_in('title', :with => '22nd October 2018')
    fill_in('body', :with => 'This is my first Diary entry')
    click_button('Save')
    expect(page).to have_content('22nd October 2018')
  end
end
