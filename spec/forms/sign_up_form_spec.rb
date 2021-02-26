require 'rails_helper'

describe SignUpForm do
  include BCrypt
  describe '.validations' do
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:day) }
    it { is_expected.to validate_presence_of(:month) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:confirm_password) }
  end

  describe '.save' do
    it 'does not save if invalid' do
      expect(described_class.new.save).to eq false
    end
    it 'creates a new user if valid' do
      form = described_class.new(
        email_address: "test@test.com",
        username: "username",
        first_name: "First",
        last_name: "Last",
        day: "1",
        month: "2",
        year: "1900",
        password: "pass",
        confirm_password: "pass"
      )

      form.save
      user = User.last

      expect(user).to have_attributes(
        email_address: "test@test.com",
        username: "username",
        first_name: "First",
        last_name: "Last",
        dob: DateTime.new(1900, 2, 1),
      )
      expect(user.password_hash).not_to eq 'pass'
      expect(user.password_hash).to be_present
    end
  end
end
