class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :update_posts_comments_counter

  private

  def update_posts_comments_counter
    post.increment!(:comments_counter)
  end
end
