# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  confirmed         :boolean          default(FALSE), not null
#  email             :string           not null
#  first_name        :string
#  last_name         :string
#  password_digest   :string
#  phone_number      :string           not null
#  role              :integer          default("member"), not null
#  verification_code :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
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
  validates :phone_number, phone: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true
end
