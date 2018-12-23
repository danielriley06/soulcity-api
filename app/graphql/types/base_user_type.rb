# frozen_string_literal: true

module Types
  class BaseUserType < BaseObject
    graphql_name 'User'
    description 'Data of a user'

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
    field :active, Boolean, null: false
    field :date_of_birth, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :avatar_link, String, null: true
  end
end
