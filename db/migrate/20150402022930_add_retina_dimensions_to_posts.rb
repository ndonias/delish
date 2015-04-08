class AddRetinaDimensionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :retina_dimensions, :text
  end
end
