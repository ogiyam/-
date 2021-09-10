class CreateSmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :small_categories do |t|
      t.integer :large_category_id, null: false
      t.string :title, null: false
      t.text :note, null: false, :limit => 4294967295

      t.timestamps
    end
  end
end
