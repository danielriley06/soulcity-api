# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false, unique: true
      t.string :password_digest
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.datetime :date_of_birth
      t.string :mobile_number, limit: 16
      t.string :mobile_number_country_code, limit: 2
      t.string :authy_id
      t.boolean :mobile_number_verified, null: false, default: false
      t.boolean :email_verified, null: false, default: false
      t.integer :club_role, index: true, null: false, default: 1
      t.integer :gender, index: true, null: false, default: 1
      t.boolean :active, null: false, default: true
      t.boolean :invited_to_dashboard, null: false, default: false
      t.boolean :invite_accepted, null: false, default: false
      t.boolean :is_club_owner, null: false, default: false
      t.string :invite_token

      t.integer :club_id, index: true, null: false
      t.integer :household_id, index: true

      t.timestamps
    end
  end
end
