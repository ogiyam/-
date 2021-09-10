class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :large_category_id, null:false
      t.string :name, null: false

      t.timestamps
    end
  end
end
