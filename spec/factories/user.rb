# frozen_string_literal: true

FactoryBot.define do
  to_create(&:save)

  factory :user do
    email { 'test@test.com' }
    mobile_number { '19016260345' }
    password { 'Wynding2016' }
    password_confirmation { 'Wynding2016' }
    first_name { 'John' }
    last_name  { 'Doe' }
    club_role { 'staff' }
    club_id { 1 }
  end
end
