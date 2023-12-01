class RenameLikesCounterInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :likesCounter, :likes_counter
  end
end
