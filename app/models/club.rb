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

class Club < Sequel::Model
  one_to_many :members, class: :User
  one_to_many :inactive_members, class: :User, conditions: { account_is_active: false }
  def validate
    super
    validates_presence %i[name]
  end
end
