class CreateCommentAncestries < ActiveRecord::Migration
  def change
    create_table :comment_ancestries do |t|
      t.integer :ancestor_id
      t.integer :descendent_id

      t.timestamps
    end

    add_index :comment_ancestries, :ancestor_id
    add_index :comment_ancestries, :descendent_id
  end
end
