class Story < ActiveRecord::Base
  attr_accessible :title, :link, :author_id, :comments_attributes

  belongs_to :author, class_name: "User"
  has_many :comments
  accepts_nested_attributes_for :comments, reject_if: :all_blank

  has_many :votes

  validates :title, :link, presence: true

  def self.popular
    self.find_by_sql(<<-SQL)
      SELECT stories.*, COUNT(upvotes.id)
      FROM stories
        LEFT JOIN upvotes
          ON stories.id = upvotes.story_id
      GROUP BY stories.id
      ORDER BY COUNT(upvotes.id) DESC, stories.created_at DESC
    SQL
  end
end
