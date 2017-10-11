require 'rails_helper'

describe CommentVote do
=begin
  let(:user) { User.create( email: 'ax@a.pl', username: 'Axl', password: 'pass123') }
  let(:post) { Post.create( title: 'random', text: 'Hi, hey, hello', user_id: user.id ) }
 	let(:comment) {Comment.create(body: 'random, random', user_id: user.id, post_id: post.id)}
  context 'is valid' do
    it 'with valid params' do
      cvote = CommentVote.create(comment_id: comment.id, user_id: user.id)
      expect(cvote).to be_valid
    end
  end
=end
  context 'is valid' do
    it { should belong_to(:user) }
    it { should belong_to(:comment) }
    it { should validate_uniqueness_of(:comment_id).scoped_to(:user_id) }
  end
end
