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

class User < Sequel::Model
  EMAIL_REGEX = /\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}/i.freeze
  plugin :secure_password

  many_to_one :address
  many_to_one :club
  many_to_one :household
  many_to_many :teams, class: :Team, left_key: :user_id, right_key: :team_id,
                       join_table: :team_rosters, conditions: { is_active: true }
  many_to_many :archived_teams, class: :Team, left_key: :user_id, right_key: :team_id,
                                join_table: :team_rosters, conditions: { is_active: false }

  # TODO: Reimplement mobile validation and sanitization
  # with sequel friendliness
  # validates :mobile_number, phone: { allow_blank: true }
  # validates :mobile_number_country_code, presence: true, length: { is: 2 }
  # before_save :sanitize_mobile_number, if: :will_save_change_to_mobile_number?

  def validate
    super
    validates_presence %i[first_name last_name club_role]
    validates_unique %i[email mobile_number]
    validates_format EMAIL_REGEX, :email
  end

  def to_token_payload
    expiration = Rails.application.credentials[:auth_token_lifetime] || 48.hours
    {
      user_id: id,
      sub: id,
      authorization: %w[admin user],
      type: 'account',
      exp: expiration.from_now.to_i
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
