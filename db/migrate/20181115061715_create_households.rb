# frozen_string_literal: true

class CreateHouseholds < ActiveRecord::Migration[5.2]
  def change
    create_table :households do |t|
      t.string :name, null: false

      t.integer :head_of_household, index: true, null: true

      t.index %i[name head_of_household], name: 'index_head_of_household_name_uniqueness', unique: true
    end
  end
end
