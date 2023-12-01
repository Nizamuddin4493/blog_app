class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user, foreign_key: 'user_id'

  after_save :update_post_likes_counter

  private

  def update_post_likes_counter
    post.increment!(:likes_counter)
  end
end
