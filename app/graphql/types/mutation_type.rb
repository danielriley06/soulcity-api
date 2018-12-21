# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :create_division, mutation: Mutations::CreateDivision
    field :create_team, mutation: Mutations::CreateTeam
  end
end
