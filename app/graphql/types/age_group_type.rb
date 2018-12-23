# frozen_string_literal: true

module Types
  class AgeGroupType < Types::BaseObject
    graphql_name 'AgeGroup'
    description 'Data of a age group'

    field :id, ID, null: false
    field :title, String, null: false
    field :max_age, Integer, null: true
  end
end
