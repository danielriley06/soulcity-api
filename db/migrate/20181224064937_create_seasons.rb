# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :seasons do
      primary_key :id
      String :name
      DateTime :start_date
      DateTime :end_date
      Boolean :active, default: true, null: false
    end
  end
end
