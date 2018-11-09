# frozen_string_literal: true

module QueryTypes
  # class UserQueryType < Types::BaseObject
  #   # Add root-level fields here.
  #   # They will be entry points for queries on your schema.

  #   field :user, Types::UserType, null: true do
  #     description 'Find a user by ID'
  #     argument :id, ID, required: true
  #   end

  #   # Then provide an implementation:
  #   def user(id:)
  #     User.find(id)
  #   end
  # end
  UserQueryType = GraphQL::ObjectType.define do
    name 'UserQueryType'
    description 'The todo list query type'

    field :users, types[Types::UserType], 'returns all users' do
      resolve ->(_obj, _args, _ctx) { User.all }
    end

    field :user, Types::UserType, 'returns the queried user' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { User.find_by!(id: args[:id]) }
    end
  end
end
