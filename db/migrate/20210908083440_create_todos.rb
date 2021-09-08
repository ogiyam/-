class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.text :task

      t.timestamps
    end
  end
end
