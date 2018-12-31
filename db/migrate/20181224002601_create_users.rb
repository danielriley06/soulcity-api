# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :email, unique: true, null: false
      String :password_digest
      String :first_name, null: false
      String :middle_name
      String :last_name, null: false
      String :nickname
      role :club_role, null: false, default: 'player'
      gender_types :gender, null: false, default: 'not_specified'
      String :mobile_number
      String :mobile_number_country_code, limit: 2
      String :authy_id
      DateTime :date_of_birth
      Boolean :mobile_number_verified, null: false, default: false
      Boolean :email_verified, null: false, default: false
      Boolean :account_is_active, null: false, default: true
      Boolean :invited_to_dashboard, null: false, default: false
      Boolean :invite_accepted, null: false, default: false
      Boolean :is_club_owner, null: false, default: false

      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, default: Sequel::CURRENT_TIMESTAMP

      index [:email]
    end
  end
end
