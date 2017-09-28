class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :upvotes, :post_id, :username

  def username
    object.user.username
  end

  def upvotes
    object.comment_votes.count
  end
end
