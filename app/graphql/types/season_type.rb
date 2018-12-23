# frozen_string_literal: true

module Types
  class SeasonType < Types::BaseObject
    graphql_name 'Season'
    description 'Data of a season'

    field :id, ID, null: false
    field :name, String, null: false
    field :start_date, GraphQL::Types::ISO8601DateTime, null: true
    field :end_date, GraphQL::Types::ISO8601DateTime, null: true
    field :active, Boolean, null: false
  end
end
