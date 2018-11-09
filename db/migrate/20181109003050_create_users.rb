# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false, unique: true
      t.string :password_digest
      t.string :phone_number, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.integer :role, index: true, null: false, default: 2
      t.string :verification_code
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end
  end
end
