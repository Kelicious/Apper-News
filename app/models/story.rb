class Story < ActiveRecord::Base
  attr_accessible :title, :link, :author_id, :comments_attributes, :points

  belongs_to :author, class_name: "User"
  has_many :comments, inverse_of: :story
  accepts_nested_attributes_for :comments, reject_if: :all_blank

  has_many :upvotes

  validates :title, :link, presence: true

  def self.popular
    self.find_by_sql(<<-SQL)
      SELECT stories.*, COALESCE(SUM(upvotes.value), 0) AS points
      FROM stories
        LEFT JOIN upvotes
          ON stories.id = upvotes.story_id
      GROUP BY stories.id
      ORDER BY SUM(upvotes.value) DESC, stories.created_at DESC
    SQL
  end
  
  def points
    @points || upvotes.sum("value")
  end

  # For the short url stub
  def domain
    temp = link.dup
    temp.slice!(/.*:\/\//)
    temp.split('/').first
  end
end
