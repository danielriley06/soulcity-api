# frozen_string_literal: true

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

FactoryBot.define do
  factory :club do
    name { 'Soul City' }
  end
end
