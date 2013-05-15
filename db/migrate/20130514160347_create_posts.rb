class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.boolean :done
      t.text :text

      t.timestamps
    end
  end
end
