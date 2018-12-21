# frozen_string_literal: true

module QueryTypes
  module SeasonQueries
    extend ActiveSupport::Concern

    included do
      field :seasons, [Types::SeasonType], null: false do
        description 'returns a list of active seasons'
      end
    end

    def seasons
      ::Season.where(active: true)
    end
  end
end
