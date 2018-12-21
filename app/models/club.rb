# frozen_string_literal: true

# == Schema Information
#
# Table name: clubs
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Club < ApplicationRecord
  validates :name, presence: true
end
