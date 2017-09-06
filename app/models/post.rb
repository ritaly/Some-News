class Post < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  def as_json(options = {})
    super(options.merge(include: :comments))
  end
end
