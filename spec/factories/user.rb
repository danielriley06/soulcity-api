# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    phone_number { '19016260345' }
    password { 'Wynding2016' }
    password_confirmation { 'Wynding2016' }
    first_name { 'John' }
    last_name  { 'Doe' }
    role { 'member' }
  end
end
