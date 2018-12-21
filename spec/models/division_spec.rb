# == Schema Information
#
# Table name: divisions
#
#  id          :bigint(8)        not null, primary key
#  ancestry    :string
#  description :string
#  name        :string
#
# Indexes
#
#  index_divisions_on_ancestry  (ancestry)
#

require 'rails_helper'

RSpec.describe Division, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
