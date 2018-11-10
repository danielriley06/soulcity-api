# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :author, class_name: 'User'
end
