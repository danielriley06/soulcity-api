# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :age_groups do
      primary_key :id
      String :title
      Integer :max_age
      Boolean :is_active, null: false, default: true
    end
  end
end
