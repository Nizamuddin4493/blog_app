class RenamePostsCounterInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :postsCounter, :posts_counter
  end
end
