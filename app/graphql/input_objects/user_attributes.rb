# frozen_string_literal: true

module InputObjects
  class UserAttributes < InputObjects::BaseInputObject
    description 'Properties for update user'

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :club_role, String, required: true
    argument :email, String, required: false
    argument :cellphone, String, required: false
    argument :gender, String, required: true
    argument :date_of_birth, GraphQL::Types::ISO8601DateTime, required: true
    argument :create_with_invite, Boolean, required: false
    argument :avatar, Scalars::File, required: false
  end
end
