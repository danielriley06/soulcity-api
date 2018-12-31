# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :team_rosters do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :team_id, :teams
      foreign_key :season_id, :seasons
      index %i[user_id team_id season_id]
      column :roles, 'text[]'
      Boolean :is_active, default: true, null: false
      String :position
    end
  end
end
