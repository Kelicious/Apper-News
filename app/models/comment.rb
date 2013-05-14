class Comment < ActiveRecord::Base
  attr_accessible :body, :parent_id, :author_id, :story_id

  belongs_to :story
  belongs_to :author

  has_many :comment_ancestries
  has_many :ancestors, through: :comment_ancestries
  has_many :descendents, through: :comment_ancestries

  validates :body, :author_id, presence: true
end

