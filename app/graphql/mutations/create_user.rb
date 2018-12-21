# frozen_string_literal: true

module Mutations
  class CreateUser < Mutations::BaseMutation
    null true

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :club_role, String, required: true
    argument :email, String, required: false
    argument :cellphone, String, required: false
    argument :gender, String, required: true
    argument :date_of_birth, GraphQL::Types::ISO8601DateTime, required: true
    argument :create_with_invite, Boolean, required: false

    field :user, ::Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(first_name:,
                last_name:,
                club_role:,
                email:,
                gender:,
                date_of_birth:,
                create_with_invite:,
                cellphone:)
      user = User.new(
        first_name: first_name,
        last_name: last_name,
        email: email,
        cellphone: cellphone,
        club_role: club_role,
        gender: gender,
        date_of_birth: date_of_birth,
        invited_to_dashboard: create_with_invite
      )
      user.skip_password_validation = true
      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
