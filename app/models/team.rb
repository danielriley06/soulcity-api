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

class Team < ApplicationRecord
  enum level: {
    not_given: 1,
    recreational: 2,
    competitive: 3,
    school: 4
  }

  enum gender: {
    coed: 1,
    male: 2,
    female: 3
  }

  belongs_to :club
  belongs_to :age_group
  # SeasonTeams Join table creates the seasons for a team,
  # each team is assigned to a Season and a Division each season.
  # Note: A team can only have one active season at a time
  has_many :season_teams
  has_one :active_season_team,
          -> { where(active: true) },
          class_name: 'SeasonTeam'
  # Seasons
  has_many :seasons, through: :season_teams
  has_one :season,
          through: :active_season_team,
          class_name: 'Season'
  # Divisions
  has_many :divisions, through: :season_teams
  has_one :division,
          through: :active_season_team,
          class_name: 'Division'
  # Rosters
  has_many :team_rosters
  has_many :active_rosters, -> { where(active: true) }, class_name: 'TeamRoster'
  has_many :members,
           through: :active_rosters,
           source: :user

  validates :club, presence: true
  validates :name, presence: true
end
