# frozen_string_literal: true

module Types
  class GenderEnum < Types::BaseEnum
    value 'not_specified', 'Gender has not been provided'
    value 'male', 'A human that identifies as a male'
    value 'female', 'A human that identifies as a female'
    value 'other', 'Catchall for all those other fluid genders'
  end
end
