# frozen_string_literal: true

module Types
  class QueryType < BaseObject
    graphql_name 'Query'
    include QueryTypes::AgeGroup

    field :current_user, Types::UserType, null: false do
      description 'returns the current user making the request'
    end

    def current_user
      User.eager(teams: %i[age_group club]).where(id: context[:current_user].id).first!
    end

    field :seasons, resolver: Resolvers::SeasonsResolver,
                    description: "A list of the club's seasons."

    field :divisions, resolver: Resolvers::DivisionsResolver,
                      description: "A list of the club's divisions."

    field :all_divisions, [Types::DivisionType], null: true

    field :division_children, [Types::DivisionType], null: true do
      argument :id, ID, required: true
    end

    field :division_ancestors, [Types::DivisionType], null: true do
      argument :id, ID, required: true
    end

    def all_divisions
      Division.all
    end

    def divisions
      Division.all
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
      argument :page_size, Integer, required: false, default_value: 25
    end

    def teams(page:, page_size:)
      Team.eager(:club, :age_group, :division, :season, :members).paginate(page, page_size)
    end

    field :users, [Types::UserType], null: true do
      argument :page, Integer, required: true
      argument :page_size, Integer, required: false, default_value: 25
    end

    def users(page:, page_size:)
      User.eager(teams: %i[age_group club]).paginate(page, page_size)
    end

    field :users_count, Integer, null: false

    def users_count
      User.count
    end
  end
end
