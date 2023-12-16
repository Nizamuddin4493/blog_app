class Post < ApplicationRecord
  has_many :likes
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  validates :likes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end
end
