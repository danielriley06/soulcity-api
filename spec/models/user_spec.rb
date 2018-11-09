# frozen_string_literal: true

require 'rails_helper'
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

    describe 'password' do
      it 'validates presence' do
        is_expected.to validate_presence_of(:password)
      end
    end

    describe 'role' do
      it 'validates presence' do
        is_expected.to validate_presence_of(:role)
      end
    end
  end

  describe 'user creation' do
    describe 'normal user' do
      let(:user) { create(:user) }

      it { expect(user.role).to eq('member') }
    end
  end
end
