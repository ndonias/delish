class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :main_image_file_name, :string
    add_column :posts, :main_image_content_type, :string
    add_column :posts, :main_image_file_size, :string
    add_column :posts, :main_image_updated_at, :datetime
    add_column :posts, :likes, :integer
  end
end
