# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.integer :role, index: true, null: false, default: 2
      t.datetime :last_login_at
      t.string :last_login_ip

      t.timestamps
    end
  end
end
