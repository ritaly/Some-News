class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :upvotes, :username

  def username
  	object.user.username
  end
end
