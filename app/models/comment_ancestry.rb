class CommentAncestry < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendent_id

  belongs_to :ancestor, class_name: "Comment"
  belongs_to :descendent, class_name: "Comment"

  validates :ancestor_id, :descendent_id, presence: true
end
