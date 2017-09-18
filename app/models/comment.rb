class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true

  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
