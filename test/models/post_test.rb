require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'the truth' do
    assert true
  end
#co z current user
  test 'should save post with title and text ' do
    post = Post.new(text: 'random tekst', title: 'Anoteher')
    assert_not post.save, 'Saved the post without a title'
  end
  test 'should not save post without title and ' do
    post = Post.new(text: 'random tekst')
    assert_not post.save, 'Saved the post without a title'
  end
  test 'should not save post without text' do
    post = Post.new(title: 'Test tekst')
    assert_not post.save, 'Saved the post without a text'
  end
end
