class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id, :author_id, :story_id

  after_create :insert_ancestors

  has_many :children, class_name: "Comment", foreign_key: "parent_id", inverse_of: :parent
  belongs_to :parent, class_name: "Comment", inverse_of: :children
  belongs_to :story, inverse_of: :comments
  belongs_to :author, class_name: "User"

  has_many :comment_ancestries, foreign_key: "ancestor_id"
  #has_many :ancestors, through: :comment_ancestries
  has_many :descendents, through: :comment_ancestries

  validates :body, :author_id, presence: true

  def self.comments_by_parent(comments)
    comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
    comments.each { |comment| comments_by_parent[comment.parent_id] << comment}
    comments_by_parent
  end

  def comments_by_parent
    Comment.comments_by_parent(descendents)
  end

  private

  def insert_ancestors
    current = self.parent
    while current
      CommentAncestry.create!(ancestor_id: current.id, descendent_id: self.id)
      current = current.parent
    end
  end
end

