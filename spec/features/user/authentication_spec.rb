feature 'authentication' do

  scenario 'go to login page from navbar' do
    visit('/')
    click_link('Login')
    expect(page).to have_content('Enter email and password to login')
  end

  scenario 'successfully signs in with the correct email and password' do
    visit('/session/new')
    fill_in('email', with: 'harry@enfield.com')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(page).to have_content('Welcome, harry@enfield.com')
  end

  scenario 'unsuccessful signin with incorrect email' do
    visit('/session/new')
    fill_in('email', with: 'harry@enfield.co')
    fill_in('password', with: 'password')
    click_button('Login')
    expect(page).not_to have_content('Welcome, harry@enfield.co')
    expect(page).to have_content('Please check your email or password.')
  end

  scenario 'unsuccessful signin with incorrect email' do
    visit('/session/new')
    fill_in('email', with: 'harry@enfield.com')
    fill_in('password', with: 'not the correct password')
    click_button('Login')
    expect(page).not_to have_content('Welcome, harry@enfield.com')
    expect(page).to have_content('Please check your email or password.')
  end

  scenario 'a user can sign out' do
    visit('/session/new')
    fill_in('email', with: 'harry@enfield.com')
    fill_in('password', with: 'password')
    click_button('Login')
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end

end
