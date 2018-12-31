# frozen_string_literal: true

# == Schema Information
#
# Table name: age_groups
#
#  id      :bigint(8)        not null, primary key
#  max_age :integer
#  title   :string
#

class AgeGroup < Sequel::Model
  def validate
    super
    validates_presence %i[title]
    validates_unique :title
  end
end
