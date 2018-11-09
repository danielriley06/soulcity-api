# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  first_name      :string
#  last_login_at   :datetime
#  last_login_ip   :string
#  last_name       :string
#  password_digest :string
#  role            :integer          default("member"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#  index_users_on_role   (role)
#

class User < ApplicationRecord
  enum role: {
    admin: 0,
    coach: 1,
    member: 2
  }

  has_secure_password

  validates :email, uniqueness: true, email: { strict_mode: true }
  validates :role, presence: true
end
