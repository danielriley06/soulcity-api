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

class Season < ApplicationRecord
  has_many :teams

  validates :name, presence: true

  before_save :expire_season,
              if: proc { |season| season.end_date.present? }

  def self.active
    where('end_date >= ? AND active = ?', Time.current, true)
  end

  def expire_season
    self.active = false
  end
end
