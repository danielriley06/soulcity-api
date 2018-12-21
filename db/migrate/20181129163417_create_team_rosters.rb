# frozen_string_literal: true

class CreateTeamRosters < ActiveRecord::Migration[5.2]
  def change
    create_table :team_rosters do |t|
      t.references :team, index: true, null: false
      t.references :season, index: true, null: false
      t.references :user, index: true, null: false
      t.string :roles, array: true, default: '{}'
      t.boolean :active, null: false, default: true
      t.string :position
    end
  end
end
