feature 'filtering entries' do
  scenario 'by category' do
    visit('/')
    click_link('Happy')
    expect(page).to have_content('First Entry')
  end
end
