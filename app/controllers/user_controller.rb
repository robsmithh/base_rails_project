# frozen_string_literal: true

class UserController < ApplicationController
  def sign_up; end

  def authenticate
    set_dob = DateTime.new(params['year'].to_i, params['month'].to_i, params['day'].to_i)
    User.create!(
      email_address: params['email_address'],
      username: params['username'],
      first_name: params['first_name'],
      last_name: params['last_name'],
      dob: set_dob
    )
    redirect_to root_path
  end
end
