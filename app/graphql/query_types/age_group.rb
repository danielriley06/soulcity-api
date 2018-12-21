# frozen_string_literal: true

module QueryTypes
  module AgeGroup
    extend ActiveSupport::Concern

    included do
      field :age_groups, [Types::AgeGroupType], null: false do
        description 'returns a list of age groups'
      end
    end

    def age_groups
      ::AgeGroup.all
    end
  end
end
