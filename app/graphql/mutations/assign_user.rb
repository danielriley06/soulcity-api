# frozen_string_literal: true

module Mutations
  class AssignUser < Mutations::BaseMutation
    null true

    argument :user_id, ID, required: true
    argument :team_id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(user_id:, team_id:)
      team = Team.select(:id, :season_id).where(id: team_id).first!
      team_roster = TeamRoster.new(
        user_id: user_id,
        team_id: team.id,
        season_id: team.season_id
      )
      if team_roster.save!
        user = User.find(id: user_id)
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
