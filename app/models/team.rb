# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id           :bigint(8)        not null, primary key
#  gender       :integer          default("coed"), not null
#  level        :integer          default("not_given"), not null
#  name         :string
#  time_zone    :string
#  zip_code     :string
#  age_group_id :bigint(8)
#  club_id      :bigint(8)        not null
#  division_id  :bigint(8)
#
# Indexes
#
#  index_teams_on_age_group_id  (age_group_id)
#  index_teams_on_club_id       (club_id)
#  index_teams_on_division_id   (division_id)
#

class Team < Sequel::Model
  many_to_one :club
  many_to_one :age_group
  # Seasons
  one_through_one :season,
                  class: :Season,
                  left_key: :team_id,
                  right_key: :season_id,
                  join_table: :season_teams, conditions: { is_active: true }
  many_to_many :archived_seasons, clone: :season, conditions: { is_active: false }
  # Divisions
  one_through_one :division,
                  class: :Division,
                  left_key: :team_id,
                  right_key: :division_id,
                  join_table: :season_teams, conditions: { is_active: true }
  # Members
  many_to_many :members,
               class: :User,
               left_key: :team_id,
               right_key: :user_id,
               join_table: :team_rosters, conditions: { is_active: true }
  many_to_many :former_members, clone: :members, conditions: { is_active: false }

  def validate
    super
    validates_presence %i[name club]
  end
end
