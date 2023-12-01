class RenameCommentsCounterInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :commentsCounter, :comments_counter
  end
end
