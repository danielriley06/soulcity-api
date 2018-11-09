# frozen_string_literal: true

require 'rails_helper'
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

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'email' do
      it 'validates uniqueness' do
        user = build(:user)

        expect(user).to validate_uniqueness_of(:email)
      end

      it 'rejects invalid emails' do
        invalid_user = build(:user, email: 'invalid@')

        expect(invalid_user).not_to be_valid
      end
    end

    describe 'phone_number' do
      it 'validates uniqueness' do
        user = build(:user)

        expect(user).to validate_uniqueness_of(:phone_number).case_insensitive
      end

      it 'rejects invalid phone numbers' do
        invalid_user = build(:user, phone_number: '901')

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
