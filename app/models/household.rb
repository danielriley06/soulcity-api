# frozen_string_literal: true

# == Schema Information
#
# Table name: households
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

class Household < Sequel::Model
  one_to_many :users

  def validate
    super
    validates_presence %i[name]
  end
end
