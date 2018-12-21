# frozen_string_literal: true
# == Schema Information
#
# Table name: season_teams
#
#  id          :bigint(8)        not null, primary key
#  active      :boolean          default(FALSE), not null
#  division_id :bigint(8)        not null
#  season_id   :bigint(8)        not null
#  team_id     :bigint(8)        not null
#
# Indexes
#
#  index_season_teams_on_active                 (active)
#  index_season_teams_on_division_id            (division_id)
#  index_season_teams_on_season_id              (season_id)
#  index_season_teams_on_team_id                (team_id)
#  index_season_teams_on_team_id_and_active     (team_id,active) UNIQUE
#  index_season_teams_on_team_id_and_season_id  (team_id,season_id) UNIQUE
#

class SeasonTeam < ApplicationRecord
  belongs_to :season
  belongs_to :team
  belongs_to :division

  validates :season, presence: true
  validates :team, presence: true
  validates :division, presence: true
end
