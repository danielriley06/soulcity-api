# frozen_string_literal: true

Sequel.migration do
  change do
    create_enum(:team_gender, %w[male female coed])
    create_enum(:team_level, %w[not_set recreational competitive school])
    create_enum(:role, %w[player guardian staff])
    create_enum(:gender_types, %w[not_specified male female non_bianary])
  end
end
