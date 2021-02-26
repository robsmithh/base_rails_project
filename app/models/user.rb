# frozen_string_literal: true

class User < ApplicationRecord
  validates :email_address, :first_name, :last_name, :dob, :username, :password_hash, presence: true

  
end
