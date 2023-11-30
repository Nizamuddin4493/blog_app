class AddUserRefToPost < ActiveRecord::Migration[7.1]
  def change
    #add_reference :posts, :author_id, null: false, foreign_key: true
  end
end
