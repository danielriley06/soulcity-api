# frozen_string_literal: true

module Resolvers
  class SeasonsResolver < Resolvers::Base
    type [Types::SeasonType], null: false

    argument :active, Boolean, required: false,
                               default_value: true,
                               description: 'Select only seasons that are active'
    argument :limit, Integer, required: false,
                              default_value: 25,
                              description: 'Maximum number of seasons to list'
    argument :page, Integer, required: false,
                             default_value: 1,
                             description: 'Fetch the {nth} page of Seasons'

    def resolve(active: true, page: 1, limit: 25)
      Season.where(active: active).page(page).limit(limit)
    end
  end
end
