# frozen_string_literal: true

module Mutations
  class CreateSeason < Mutations::BaseMutation
    null true

    argument :name, String, required: true
    argument :start_date, String, required: false
    argument :end_date, String, required: false
    argument :active, Boolean, required: false

    field :season, Types::SeasonType, null: true
    field :errors, [String], null: false

    def resolve(name:, start_date:, end_date:, active:)
      formatted_start_date = start_date.blank? ? nil : Date.parse(start_date)
      formatted_end_date = end_date.blank? ? nil : Date.parse(end_date)
      season = Season.new(
        name: name,
        start_date: formatted_start_date,
        end_date: formatted_end_date,
        active: active
      )
      ap season
      if season.save!
        { season: season, errors: [] }
      else
        { season: nil, errors: season.errors.full_messages }
      end
    end
  end
end
