class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :genres, :large_category_id, true
  end

  def down
    #change_column_null :genres, :large_category_id, false
  end
end

