feature 'adding a diary entry' do

  scenario 'successfully add new diary entry and show entry log' do
    visit_new_entry_page_and_fill_in_title_and_body
    click_button('Save')
    expect(page).to have_content('Test title')
  end


  scenario 'successfully add new diary entry with tags and show entry log' do
    visit_new_entry_page_and_fill_in_title_and_body
    add_tags_to_diary_entry
    click_button('Save')
    expect(page).to have_content('Test title')
    expect(page).to have_content('Happy')
    expect(page).to have_content('Sport')
  end


  # scenario 'does not submit form if no title' do
  #   visit '/new-entry'
  #   # fill_in('title', :with => '22nd October 2018')
  #   fill_in('body', :with => 'This is my first Diary entry')
  #   click_button('Save')
  #   expect(page).to have_content('New Entry')
  # end

end
