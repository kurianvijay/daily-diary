require 'user'

describe User do

  describe '::get' do
    it 'retrives the user data from the database given id' do
      user = User.find(1)
      expect(user.first_name).to eq 'Harry'
      expect(user.last_name).to eq 'Enfield'
      expect(user.email).to eq 'harry@enfield.com'
    end
  end

  describe '::create' do
    it 'adds a new user to the database and return the user object' do
      email = '007@mi6.gov'
      user = User.create(first_name: 'James', last_name: 'Bond', email: email, password: 'password')
      expect(User.find(user.id)).to be_a(User)
    end
  end

  describe '::authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      authenticated_user = User.authenticate(email: 'harry@enfield.com', password: 'password')
      expect(authenticated_user.id).to eq '1'
    end
  end

end
