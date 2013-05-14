class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :author_id
      t.integer :story_id
      t.integer :parent_id

      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :story_id
    add_index :comments, :parent_id
  end
end
