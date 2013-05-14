class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :emails_attributes
  has_secure_password

  before_save :create_remember_token

  has_many :emails, dependent: :destroy
  accepts_nested_attributes_for :emails
  #has_many :stories, foreign_key: :author_id
  #has_many :comments

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end