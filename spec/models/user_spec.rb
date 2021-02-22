# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '.validations' do
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:dob) }
    it { is_expected.to validate_presence_of(:username) }
  end
end
