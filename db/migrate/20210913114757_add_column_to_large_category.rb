class AddColumnToLargeCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :large_categories, :genre_id, :integer
  end
end
