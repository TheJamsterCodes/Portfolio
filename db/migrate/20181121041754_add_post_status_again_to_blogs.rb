class AddPostStatusAgainToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :post_status, :integer, default: 0
  end
end
