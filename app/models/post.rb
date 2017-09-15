class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, :text, presence: true

  def as_json(options = {})
    #super(options.merge(include: :comments).merge(include: :user))
    #czy to znaczy ze jak mam serializer to as_json jest mi nie potrzebna?
  end
 end
