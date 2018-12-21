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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
