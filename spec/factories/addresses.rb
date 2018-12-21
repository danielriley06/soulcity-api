# == Schema Information
#
# Table name: addresses
#
#  id                  :bigint(8)        not null, primary key
#  city                :string
#  latitude            :decimal(15, 10)
#  longitude           :decimal(15, 10)
#  original_attributes :text
#  state               :string
#  street              :string
#  street2             :string
#  verification_info   :text
#  zip_code            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint(8)
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

FactoryBot.define do
  factory :address do
    street { "MyString" }
    street2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { "MyString" }
    latitude { "9.99" }
    longitude { "9.99" }
    verification_info { "MyText" }
    original_attributes { "MyText" }
  end
end
