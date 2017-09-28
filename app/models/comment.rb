class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_votes, dependent: :destroy
  has_many :upvoting_users, through: :comment_votes, source: :user
  validates :body, presence: true
end
