class Upvote < ActiveRecord::Base
  attr_accessible :user_id, :story_id, :value

  validates :user_id, :story_id, :value, presence: true
  validates :user_id, uniqueness: {scope: [:story_id]}
end
