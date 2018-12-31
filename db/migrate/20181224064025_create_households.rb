# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :households do
      primary_key :id
      String :name
      foreign_key :user_id, :users

      unique %i[user_id name]
    end
  end
end
