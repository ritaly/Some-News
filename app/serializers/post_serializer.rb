class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :upvotes, :user, :text, :url
  has_many :comments

  def url
    post_url(object)
  end

  def upvotes
  	object.votes.count
  end
end
