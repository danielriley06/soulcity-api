# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :name, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :active, null: false, default: true
    end
  end
end
