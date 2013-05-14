class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :author_id
      t.string :link

      t.timestamps
    end

    add_index :stories, :author_id
  end
end
