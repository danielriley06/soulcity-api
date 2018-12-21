# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    include QueryTypes::AgeGroup

    field :seasons, [Types::SeasonType], null: false do
      description 'returns a list of active seasons'
    end

    def seasons
      ::Season.where(active: true)
    end

    field :current_user, Types::UserType, null: false do
      description 'returns the queried user'
    end

    def current_user
      User.includes(:avatar_attachment, teams: %i[age_group club]).find_by!(id: context[:current_user])
    end

    field :divisions, [Types::DivisionType], null: true

    field :all_divisions, [Types::DivisionType], null: true

    field :division_children, [Types::DivisionType], null: true do
      argument :id, ID, required: true
    end

    field :division_ancestors, [Types::DivisionType], null: true do
      argument :id, ID, required: true
    end

    def all_divisions
      Division.arrange_serializable
    end

    def divisions
      Division.roots
    end

    def division_children(id:)
      Division.children_of(id)
    end

    def division_ancestors(id:)
      Division.children_of(id)
    end
    field :teams_total, Integer, null: false

    def teams_total
      Team.count
    end

    field :teams, [Types::TeamType], null: true do
      argument :page, Integer, required: true
    end

    def teams(page:)
      Team.includes(:club, :age_group, :division, :season, :members).page(page)
    end

    field :users, [Types::UserType], null: true do
      argument :page, Integer, required: true
    end

    def users(page:)
      User.includes(:avatar_attachment, teams: %i[age_group club]).page(page).without_count
    end

    field :users_count, Integer, null: false

    def users_count
      User.count
    end
  end
end
