# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, null: false
      t.string :name
      t.string :password_digest
      t.integer :role, index: true, null: false, default: 2

      t.timestamps
    end
  end
end
