# frozen_string_literal: true

module Types
  class TeamType < Types::BaseObject
    graphql_name 'Team'
    description 'Data of a team'

    field :id, ID, null: false
    field :name, String, null: false
    field :level, String, null: true
    field :gender, Types::TeamGenderEnum, null: true
    field :zip_code, String, null: true
    field :time_zone, String, null: true
    field :club, Types::ClubType, null: true
    field :age_group, Types::AgeGroupType, null: true
    field :division, Types::DivisionType, null: true
    field :season, Types::SeasonType, null: true
    field :members, [Types::UserType], null: true
  end
end
