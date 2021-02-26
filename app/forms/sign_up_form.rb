class SignUpForm
  include ActiveModel::Model
  include BCrypt

  attr_accessor :email_address, :username, :first_name, :last_name,
                :day, :month, :year, :password, :confirm_password

  validates :first_name, :last_name, :day, :month, :year, :username, :password, :confirm_password, presence: true

  validates :email_address, presence: true

  def save
    return false unless valid?

    User.create!(
      email_address: email_address,
      username: username,
      first_name: first_name,
      last_name: last_name,
      dob: set_dob,
      password_hash: Password.create(password)
    )
  end

private

  def set_dob
    DateTime.new(year.to_i, month.to_i, day.to_i)
  end
end
