# frozen_string_literal: true

class User < ApplicationRecord
  validates :email_address, :first_name, :last_name, :dob, :username, presence: true
end
