# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(TRUE), not null
#  end_date   :datetime
#  name       :string           not null
#  start_date :datetime
#

class Season < Sequel::Model
  # Teams
  many_to_many :teams,
               class: :Team,
               left_key: :season_id,
               right_key: :team_id,
               join_table: :season_teams, conditions: { is_active: true }
  many_to_many :former_teams, clone: :teams, conditions: { is_active: false }

  # TODO: Need to sort out handling season expiration

  def validate
    super
    validates_presence %i[name]
  end

  def self.active
    where('end_date >= ? AND active = ?', Time.current, true)
  end

  def expire_season
    self.active = false
  end
end
