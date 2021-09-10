class CreateLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_categories do |t|
      t.integer :user_id, null: false
      t.string :problem, null: false
      t.string :solution, null: false

      t.timestamps
    end
  end
end
