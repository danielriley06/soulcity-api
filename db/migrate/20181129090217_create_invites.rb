# frozen_string_literal: true

class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :email, index: true
      t.string :cellphone, index: true
      t.string :token, index: true
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.integer :invitable_id
      t.string  :invitable_type
      t.index %i[invitable_id invitable_type]

      t.timestamps
    end
  end
end
