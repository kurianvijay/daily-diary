require_relative 'postgresql_manager'
require 'bcrypt'

class User

  def self.find(id)
    return nil unless id
    q =   "SELECT * FROM Users"\
          " WHERE"\
          " id='#{id}';"
    initialize((PostgresqlManager.query(q))[0])
  end

  def self.create(first_name:, last_name:, email:, password:)
    q =   "INSERT INTO Users"\
          "(first_name, last_name, email, password)"\
          " VALUES"\
          " ('#{first_name}', '#{last_name}', '#{email}', '#{BCrypt::Password.create(password)}')"\
          " RETURNING"\
          " id, first_name, last_name, email;"
    initialize((PostgresqlManager.query(q))[0])
  end

  def self.initialize(user)
    User.new(id: user['id'], first_name: user['first_name'], last_name: user['last_name'], email: user['email'])
  end

  attr_reader :id, :first_name, :last_name, :email

  def initialize(id:, first_name:, last_name:, email:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
