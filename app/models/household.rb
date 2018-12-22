# frozen_string_literal: true
# == Schema Information
#
# Table name: households
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

class Household < ApplicationRecord
  has_many :users

  validates :name, presence: true
end
