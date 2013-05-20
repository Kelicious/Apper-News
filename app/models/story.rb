class Story < ActiveRecord::Base
  attr_accessible :title, :link, :author_id, :comments_attributes

  belongs_to :author, class_name: "User"
  has_many :comments
  accepts_nested_attributes_for :comments, reject_if: :all_blank

  has_many :votes

  validates :title, :link, presence: true

  def self.popular
    self.find_by_sql(<<-SQL)
      SELECT stories.*
      FROM stories
        JOIN upvotes
          ON stories.id = upvotes.story_id
      WHERE upvotes.created_at > (SELECT DATETIME('now', '-1 day'))
      GROUP BY stories.id
      HAVING COUNT(upvotes.id) > 0
      ORDER BY COUNT(upvotes.id) DESC
    SQL
  end
end
