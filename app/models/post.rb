class Post < ApplicationRecord
  has_many :likes
  has_many :comments, dependent: :destroy
  belongs_to :user, foreign_key: 'user_id'

  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_posts_counter
    user.increment!(:posts_counter)
  end
end
