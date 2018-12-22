# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                         :bigint(8)        not null, primary key
#  active                     :boolean          default(TRUE), not null
#  club_role                  :integer          default("player"), not null
#  date_of_birth              :datetime
#  email                      :string           not null
#  email_verified             :boolean          default(FALSE), not null
#  first_name                 :string           not null
#  gender                     :integer          default("not_specified"), not null
#  invite_accepted            :boolean          default(FALSE), not null
#  invite_token               :string
#  invited_to_dashboard       :boolean          default(FALSE), not null
#  is_club_owner              :boolean          default(FALSE), not null
#  last_name                  :string           not null
#  middle_name                :string
#  mobile_number              :string(16)
#  mobile_number_country_code :string(2)
#  mobile_number_verified     :boolean          default(FALSE), not null
#  password_digest            :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  authy_id                   :string
#  club_id                    :integer          not null
#  household_id               :integer
#
# Indexes
#
#  index_users_on_club_id       (club_id)
#  index_users_on_club_role     (club_role)
#  index_users_on_email         (email)
#  index_users_on_gender        (gender)
#  index_users_on_household_id  (household_id)
#

class User < ApplicationRecord
  enum club_role: {
    player: 1,
    guardian: 2,
    staff: 3
  }

  enum gender: {
    not_specified: 1,
    male: 2,
    female: 3,
    other: 4
  }

  has_secure_password
  has_one_attached :avatar
  has_one :address
  belongs_to :club
  belongs_to :household
  has_many :team_rosters
  has_many :active_rosters, -> { where(active: true) }, class_name: 'TeamRoster'
  has_many :teams, through: :active_rosters

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, email: { strict_mode: true }
  validates :mobile_number, phone: { allow_blank: true }
  # validates :mobile_number_country_code, presence: true, length: { is: 2 }
  validates :club_role, presence: true

  # before_save :sanitize_mobile_number, if: :will_save_change_to_mobile_number?

  def to_token_payload
    {
      user_id: id,
      sub: id,
      authorization: %w[admin user],
      type: 'account',
      exp: Knock.token_lifetime.from_now.to_i
    }
  end

  def avatar_link
    return unless avatar.attached?

    Rails.application.routes.url_helpers.rails_blob_path(
      avatar, only_path: true
    )
  end

  private

  def sanitize_mobile_number
    self.mobile_number = Phonelib.parse(
      mobile_number,
      mobile_number_country_code
    ).e164
  end
end
