class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.boolean :done
      t.text :text

      t.timestamps
    end
  end
end
