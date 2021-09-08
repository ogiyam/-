class CreateSmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :small_categories do |t|
      t.integer :middle_categories_id, null: false
      t.string :title, null: false
      t.text :note, :limit => 4294967295, null: false

      t.timestamps
    end
  end
end
