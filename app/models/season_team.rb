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

class SeasonTeam < Sequel::Model
  one_to_many :season
  one_to_many :team
  one_to_many :division

  def validate
    super
    validates_presence %i[season_id team_id division_id]
  end
end
