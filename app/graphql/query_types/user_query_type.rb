# frozen_string_literal: true

module QueryTypes
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
