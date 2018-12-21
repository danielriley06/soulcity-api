# frozen_string_literal: true

module Mutations
  class UpdateUser < Mutations::BaseMutation
    null true

    argument :avatar, Scalars::Upload, required: true

    field :user, ::Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(avatar:)
      user = User.find_by!(
        id: context[:current_user]
      )
      if user.avatar.attach(io: avatar, filename: avatar.original_filename)
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
