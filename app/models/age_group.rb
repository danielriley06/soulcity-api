# == Schema Information
#
# Table name: age_groups
#
#  id      :bigint(8)        not null, primary key
#  max_age :integer
#  title   :string
#

class AgeGroup < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
