require 'rails_helper'

describe Comment do
  let(:user) { User.create( { email: 'ax@a.pl', username: 'Axl', password: 'pass123'} ) }
  let(:post) { Post.create( { title: 'random', text: 'Hi, hey, hello', user_id: user.id } ) }
  let(:params) { { body: 'random, random', user_id: user.id, post_id: post.id} }
  let(:comment) {Comment.new(params)}

  context 'is valid' do
    it 'with valid params' do
      expect(comment).to be_valid
    end
  end
  context 'is invalid' do
    %i[body user_id post_id].each do |attr|
      it "without #{attr}" do
        comment.public_send("#{attr}=", nil)
        expect(comment).not_to be_valid
      end
   end
  end
end
