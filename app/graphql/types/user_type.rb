# frozen_string_literal: true

module Types
  class UserType < BaseObject
    graphql_name 'User'
    description 'Data of the Current User'

    field :id, ID, null: false
    field :first_name, String, null: false
    field :middle_name, String, null: true
    field :last_name, String, null: false
    field :email, String, null: false
    field :mobile_number, String, null: true
    field :club_role, String, null: false
    field :gender, Types::GenderEnum, null: false
    field :mobile_number_verified, Boolean, null: false
    field :email_verified, Boolean, null: false
    field :invited_to_dashboard, Boolean, null: false
    field :invite_accepted, Boolean, null: false
    field :is_club_owner, Boolean, null: false
    field :account_is_active, Boolean, null: false
    field :date_of_birth, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :avatar_link, String, null: true
    field :club, Types::ClubType, hash_key: :club, null: true
    field :teams, [Types::TeamType], hash_key: :teams, null: true
  end
end
