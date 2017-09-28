require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should not save comment without body' do
    comment = Comment.new(post_id: 0, user_id: 1)
    assert_not comment.save
  end

  test 'should save comment with body' do
    comment = Comment.new(body: 'MyString', post_id: 0, user_id: 1)
    assert_not comment.save
  end
end
