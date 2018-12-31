# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :addresses do
      primary_key :id
      String :street
      String :street2
      String :city
      String :state
      String :zip_code
      Decimal :latitude
      Decimal :longitude
      Text :verification_info
      Text :original_attributes

      foreign_key :user_id, :users, index: true, null: false
    end
  end
end
