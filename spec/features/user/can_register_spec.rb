feature 'user registration' do
  scenario 'user registers for an account syccessfully' do
    visit('/user_registration')
    fill_in('first_name', with: 'James')
    fill_in('last_name', with: 'Bond')
    fill_in('email', with: '007@mi6.gov')
    click_button('Register')
    expect(page).to have_content('Registration successful')
  end
end
