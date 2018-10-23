feature 'get one entry' do
  scenario 'user selects an entry and is displayed shown the entry title and body' do
    visit('/')
    click_link('entry_1')
    expect(page).to have_content('Test')
    expect(page).to have_content('Test')
  end
end
