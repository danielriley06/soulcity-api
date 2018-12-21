# frozen_string_literal: true

class CreateSeasonTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :season_teams do |t|
      t.references :team, index: true, null: false
      t.references :season, index: true, null: false
      t.references :division, index: true, null: false
      t.boolean :active, index: true, null: false, default: false
    end
    add_index :season_teams, %i[team_id season_id], unique: true
    add_index :season_teams, %i[team_id active], unique: true
  end
end
