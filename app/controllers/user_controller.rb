# frozen_string_literal: true

class UserController < ApplicationController

  def sign_up
    @sign_up_form = SignUpForm.new
  end

  def authenticate
    @sign_up_form = SignUpForm.new(sign_up_params)
    set_dob = DateTime.new(params['year'].to_i, params['month'].to_i, params['day'].to_i)
    User.create!(
      email_address: params['email_address'],
      username: params['username'],
      first_name: params['first_name'],
      last_name: params['last_name'],
      dob: set_dob,
      password: Password.create(params['password'])
    )
    redirect_to root_path
  end

private

  def sign_up_params
    params.require(:sign_up_form).permit(:email_address, :username, :first_name,
       :last_name, :day, :month, :year, :password, :confirm_password)
  end
end
