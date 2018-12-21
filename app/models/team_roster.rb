# frozen_string_literal: true
# == Schema Information
#
# Table name: team_rosters
#
#  id        :bigint(8)        not null, primary key
#  active    :boolean          default(TRUE), not null
#  position  :string
#  roles     :string           default([]), is an Array
#  season_id :bigint(8)        not null
#  team_id   :bigint(8)        not null
#  user_id   :bigint(8)        not null
#
# Indexes
#
#  index_team_rosters_on_season_id  (season_id)
#  index_team_rosters_on_team_id    (team_id)
#  index_team_rosters_on_user_id    (user_id)
#

class TeamRoster < ApplicationRecord
  belongs_to :team
  belongs_to :season
  belongs_to :user

  validates :team, presence: true
  validates :season, presence: true
  validates :user, presence: true
  validates :active, presence: true

  def self.active
    joins(:season).where(active: true, season: { active: true })
  end
end
