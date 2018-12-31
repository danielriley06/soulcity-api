# frozen_string_literal: true

module Types
  class DivisionType < Types::BaseObject
    graphql_name 'Division'
    description 'Data of a division'

    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :parent_id, ID, null: true
    field :children, [Types::DivisionType], null: true
  end
end
