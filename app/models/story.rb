class Story < ActiveRecord::Base
  attr_accessible :title, :link, :author_id, :comments_attributes

  belongs_to :author, class_name: "User"
  has_many :comments
  accepts_nested_attributes_for :comments, reject_if: :all_blank

  has_many :votes

  validates :title, :link, presence: true
end