class AddDefaultToPostsViews < ActiveRecord::Migration[8.1]
  def change
    change_column_default :posts, :views, 0
  end
end
