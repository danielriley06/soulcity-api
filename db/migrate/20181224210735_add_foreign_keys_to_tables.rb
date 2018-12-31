# frozen_string_literal: true

Sequel.migration do
  change do
    add_column :users, :club_id, Integer, null: false, index: true
    add_column :teams, :club_id, Integer, null: false, index: true
    add_column :teams, :age_group_id, Integer, index: true
  end
end
