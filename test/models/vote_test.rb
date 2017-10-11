require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'should not be able to create vote with post and user' do
    vote = Vote.new
    assert_not vote.save
  end

  test 'should save vote for user' do
    post = Post.new(title: 'nice test', text: 'MyString', user_id: 1)
    assert_not post.save
  end

  test 'should be unique for user' do
    post = Post.create(title: 'nice test', text: 'MyString', user_id: 1)
    post_dup = post.dup
    assert_not post_dup.valid?
  end
end
