class User < ApplicationRecord
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  validates :name, presence: true
  validates :posts_counter, length: { minimum: 0 }, numericality: { only_integer: true }
  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end
end
