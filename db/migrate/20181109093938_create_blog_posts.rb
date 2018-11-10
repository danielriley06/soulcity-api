# frozen_string_literal: true

class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.json :body, null: false
      t.belongs_to :author
      t.datetime :published_at

      t.timestamps
    end
  end
end
