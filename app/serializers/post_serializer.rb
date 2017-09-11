class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :upvotes, :comments, :url
  has_many :comments
  def url
    post_url(object)
  end
end
