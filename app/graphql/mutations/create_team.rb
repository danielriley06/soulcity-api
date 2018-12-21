# frozen_string_literal: true

module Mutations
  class CreateTeam < Mutations::BaseMutation
    null true

    argument :name, String, required: true
    argument :season_id, String, required: true
    argument :division_id, String, required: true
    argument :age_group_id, String, required: false

    field :team, Types::TeamType, null: true
    field :errors, [String], null: false

    def resolve(name:, season_id:, division_id:, age_group_id:)
      puts 'Hi!'
      user = User.find_by!(
        id: context[:current_user]
      )
      team = Team.new(
        name: name,
        age_group_id: age_group_id,
        club_id: user.club_id
      )
      if team.save!
        SeasonTeam.create(
          team_id: team.id,
          season_id: season_id,
          division_id: division_id
        )
        { team: team, errors: [] }
      else
        ap team.errors.full_messages
        { team: nil, errors: team.errors.full_messages }
      end
    end
  end
end
