class CreateMiddleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :middle_categories do |t|
      t.integer :large_categories_id, null: false
      t.string :problem, null: false
      t.string :solution, null: false

      t.timestamps
    end
  end
end
