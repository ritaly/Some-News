require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
	#nie dziala bo nie zalogowany
	def setup
    @post = posts(:one)
  end

  test 'should get posts list' do
    get posts_url
    assert_response :success
  end
=begin
  test 'should create post' do
  	assert_difference('Post.count') do
      post posts_url, params: {
      	post: { title: 'Rails is awesome!', text: 'HelloRails', user_id: 1}
      }
    end
    assert_response :success
  end
=end
=begin
test "creating a post" do
  visit root_url

  fill_in "Title", with: "Creating an Article"
  fill_in "Text", with: "Created this article successfully!"

  click_on "Post"

  assert_text "Creating a Post"
end
=end
end
