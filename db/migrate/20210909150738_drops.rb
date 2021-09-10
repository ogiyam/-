class Drops < ActiveRecord::Migration[5.2]
  def change
     drop_table :middle_categories
  end
end
