class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
