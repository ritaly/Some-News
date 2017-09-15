class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :upvotes, :comments, :user, :text, :url
  has_many :comments
  def url
    post_url(object)
  end
end
