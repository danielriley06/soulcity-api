# frozen_string_literal: true

# == Schema Information
#
# Table name: blog_posts
#
#  id           :bigint(8)        not null, primary key
#  body         :json             not null
#  published_at :datetime
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :bigint(8)
#
# Indexes
#
#  index_blog_posts_on_author_id  (author_id)
#


require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it { should belong_to(:author) }
end
