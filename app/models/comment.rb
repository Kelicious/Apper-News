class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id, :author_id, :story_id

  after_create :insert_ancestors

  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment"
  belongs_to :story
  belongs_to :author, class_name: "User"

  has_many :comment_ancestries, foreign_key: "ancestor_id"
  #has_many :ancestors, through: :comment_ancestries
  has_many :descendents, through: :comment_ancestries

  validates :body, :author_id, presence: true

  private

  def insert_ancestors
    current = self.parent
    while current
      CommentAncestry.create!(ancestor_id: current.id, descendent_id: self.id)
      current = current.parent
    end
  end
end

