class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.integer :small_category_id
      t.timestamps
    end
  end
end
