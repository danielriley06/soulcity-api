# frozen_string_literal: true

class AddIsClubOwnerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_club_owner, :boolean, null: false, default: false
    add_column :users, :notify, :boolean, null: false, default: true
    add_reference :users, :club, index: true
  end
end
