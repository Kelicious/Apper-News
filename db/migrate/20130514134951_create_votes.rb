class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :story_id
      t.integer :value

      t.timestamps
    end

    add_index :votes, :user_id
    add_index :votes, :story_id
  end
end
