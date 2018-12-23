# frozen_string_literal: true

module Resolvers
  class DivisionsResolver < Resolvers::Base
    type [Types::DivisionType], null: false

    argument :active, Boolean, required: false,
                               default_value: true,
                               description: 'Select only divisions that are active'
    argument :limit, Integer, required: false,
                              default_value: 25,
                              description: 'Maximum number of divisions to list'
    argument :page, Integer, required: false,
                             default_value: 1,
                             description: 'Fetch the {nth} page of divisions'

    def resolve(active: true, page: 1, limit: 25)
      Division.page(page).limit(limit)
    end
  end
end
