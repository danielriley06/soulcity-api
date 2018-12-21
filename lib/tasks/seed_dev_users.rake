# frozen_string_literal: true

require 'ffaker'

namespace :users do
  desc 'Seeds dev users'
  task seed_dev: :environment do
    initial_user_count = User.count
    50.times do
      User.new.tap do |u|
        fake_password = FFaker::Internet.password
        u.first_name = FFaker::Name.first_name
        u.last_name = FFaker::Name.last_name
        u.club_role = rand(1..3)
        u.gender = rand(1..3)
        u.email = FFaker::Internet.unique.safe_email
        u.cellphone = FFaker::PhoneNumber.short_phone_number
        u.date_of_birth = FFaker::Time.date
        u.password = fake_password
        u.password_confirmation = fake_password
        u.save!
      end
    end
    new_user_count = User.count
    p "Created #{new_user_count - initial_user_count} users"
  end
end
