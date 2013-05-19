class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :story_id
      t.integer :value

      t.timestamps
    end

    add_index :upvotes, [:story_id, :user_id]
  end
end
