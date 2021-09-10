class Records < ActiveRecord::Migration[5.2]
  def change
    drop_table :small_categories
  end
end
