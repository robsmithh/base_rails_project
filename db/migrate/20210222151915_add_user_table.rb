# frozen_string_literal: true

class AddUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.datetime :dob
      t.string :username
      t.timestamps
    end
  end
end
