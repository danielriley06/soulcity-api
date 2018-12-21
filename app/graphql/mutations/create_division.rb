# frozen_string_literal: true

module Mutations
  class CreateDivision < Mutations::BaseMutation
    null true

    argument :name, String, required: true
    argument :description, String, required: false
    argument :parent_id, String, required: false

    field :division, ::Types::DivisionType, null: true
    field :errors, [String], null: false

    def resolve(name:, description:, parent_id:)
      division = Division.new(name: name, description: description, parent_id: parent_id)
      if division.save!
        { division: division, errors: [] }
      else
        { division: nil, errors: division.errors.full_messages }
      end
    end
  end
end
