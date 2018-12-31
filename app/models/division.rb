# frozen_string_literal: true

# == Schema Information
#
# Table name: divisions
#
#  id          :bigint(8)        not null, primary key
#  ancestry    :string
#  description :string
#  name        :string
#
# Indexes
#
#  index_divisions_on_ancestry  (ancestry)
#

class Division < Sequel::Model
  many_to_one :parent, class: self
  one_to_many :children, key: :parent_id, class: self

  # Teams
  many_to_many :teams,
               class: :Team,
               left_key: :division_id,
               right_key: :team_id,
               join_table: :season_teams, conditions: { is_active: true }
  many_to_many :former_teams, clone: :teams, conditions: { is_active: false }
end
