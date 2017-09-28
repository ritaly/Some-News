class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :votes, dependent: :destroy
  has_many :upvoted_post, through: :votes, source: :post

  has_many :comment_votes, dependent: :destroy
  has_many :upvoted_comments, through: :comments_votes, source: :comment
  has_many :posts
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..20

	validates :username, presence: true
	validates :username, uniqueness: true, if: -> { self.username.present? }
end
