# frozen_string_literal: true

module Types
  class TeamGenderEnum < Types::BaseEnum
    graphql_name 'TeamGender'
    description 'Specifies the gender of a team'

    value 'male', 'A team consisting solely of males'
    value 'female', 'A team consisting solely of females'
    value 'coed', 'A team consisting of all the genders'
  end
end
