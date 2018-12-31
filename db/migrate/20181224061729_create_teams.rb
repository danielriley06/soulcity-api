# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :teams do
      primary_key :id
      String :name
      String :zip_code
      String :time_zone
      team_gender :gender
      team_level :level
    end
  end
end
