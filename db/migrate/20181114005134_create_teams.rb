# frozen_string_literal: true

class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :level, null: false, default: 1
      t.integer :gender, null: false, default: 1
      t.string :zip_code
      t.string :time_zone

      t.references :club, index: true, null: false
      t.references :division, index: true
      t.references :age_group, index: true
    end
  end
end
