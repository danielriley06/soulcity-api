class CreateDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name
      t.string :description
      t.string :ancestry
    end
    add_index :divisions, :ancestry
  end
end
