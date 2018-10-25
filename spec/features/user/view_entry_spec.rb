feature 'get one entry' do
  scenario 'user selects an entry and is displayed shown the entry title and body' do
    visit('/')
    click_link("entry_1")
    expect(page).to have_content("First Entry")
    expect(page).to have_content("Test first body")
  end
end
