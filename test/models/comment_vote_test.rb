require 'test_helper'

class CommentVoteTest < ActiveSupport::TestCase
  test 'should not be able to create vote for comment' do
    commentvote = Vote.new
    assert_not commentvote.save
  end
  test 'should save vote comment for user and post' do
    comment = Comment.new(body: 'MyString', post_id: 0, user_id: 1)
    assert_not comment.save
  end
  test 'should be unique vote for user' do
    comment = Comment.create(body: 'MyString', post_id: 0, user_id: 1)
    comment_dup = comment.dup
    assert_not comment_dup.valid?
  end
end
