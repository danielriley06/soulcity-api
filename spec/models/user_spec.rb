# frozen_string_literal: true

require 'rails_helper'
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

RSpec.describe User, type: :model do
  it { should validate_unique :email }
  describe 'validations' do
    describe 'email' do
      it 'validates uniqueness' do
        user = create(:user)

        expect(user).to validate_unique(:email)
      end

      it 'rejects invalid emails' do
        invalid_user = build(:user, email: 'invalid@')

        expect(invalid_user).not_to be_valid
      end
    end

    describe 'mobile_number' do
      it 'validates uniqueness' do
        user = build(:user)

        expect(user).to validate_unique(:mobile_number).case_insensitive
      end

      it 'rejects invalid phone numbers' do
        invalid_user = build(:user, mobile_number: '901')

        expect(invalid_user).not_to be_valid
      end
    end

    describe 'password' do
      it 'validates presence' do
        user = build(:user, password: nil)

        expect(user).to validate_presence_of(:password)
      end
    end

    describe 'role' do
      it 'validates presence' do
        user = build(:user)

        expect(user).to validate_presence_of(:role)
      end
    end
  end

  describe 'user creation' do
    describe 'normal user' do
      let(:user) { create(:user) }

      it { expect(user.role).to eq('member') }
      it { expect(user.confirmed?).to be_falsey }
    end
  end
end
