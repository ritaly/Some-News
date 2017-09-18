class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :votes, dependent: :destroy
  has_many :upvoted_post, through: :votes, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
