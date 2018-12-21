# frozen_string_literal: true

module Types
  class ClubType < Types::BaseObject
    description 'Data of a club'

    field :id, ID, null: false
    field :name, String, null: false
  end
end
