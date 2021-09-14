class RemoveColumnFromGenre < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :large_category_id, :integer
  end
end
