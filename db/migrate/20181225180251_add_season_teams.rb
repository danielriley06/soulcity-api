# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :season_teams do
      primary_key :id
      foreign_key :team_id, :teams, index: true
      foreign_key :season_id, :seasons, index: true
      foreign_key :division_id, :divisions, index: true
      Boolean :is_active, null: false, default: true

      index %i[team_id season_id]
      index %i[team_id division_id]
    end
  end
end
