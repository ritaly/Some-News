class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :upvoting_users, through: :votes, source: :user

  belongs_to :user #, optional: true
  validates :title, :text, presence: true
 end
