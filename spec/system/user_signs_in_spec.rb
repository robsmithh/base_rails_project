# frozen_string_literal: true

require 'rails_helper'

describe 'user signs up' do
  it 'new user can create account' do
    when_i_arrive_on_the_homepage
    and_i_click_sign_up
    then_i_see_the_sign_up_page

    when_i_fill_in_my_details
    and_click_create_account
    then_i_see_the_index_page
    and_i_am_told_my_account_is_created
  end

  def when_i_arrive_on_the_homepage
    visit '/'
  end

  def and_i_click_sign_up
    click_link 'Sign up'
  end

  def then_i_see_the_sign_up_page
    expect(page).to have_current_path signup_path
  end

  def when_i_fill_in_my_details
    fill_in '#first_name', with: 'Rob'
    fill_in '#last_name', with: 'Smith'
    fill_in '#email_address', with: 'rob.smith@me.com'
    fill_in '#username', with: 'robsmith'
    fill_in '#day', with: '31'
    fill_in '#month', with: '10'
    fill_in '#year', with: '1990'
  end

  def and_click_create_account
    click_button 'Create account'
  end

  def then_i_see_the_index_page
    expect(page).to have_current_path index_path
  end

  def and_i_am_told_my_account_is_created
    expect(page).to have_content 'Your account was successfully created.'
  end
end
