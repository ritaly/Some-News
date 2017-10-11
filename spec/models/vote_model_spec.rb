require 'rails_helper'

describe Vote do
  let(:user) { User.create( email: 'ax@a.pl', username: 'Axl', password: 'pass123') }
  let(:post) { Post.create( title: 'random', text: 'Hi, hey, hello', user_id: user.id ) }

 context 'is valid' do
    it 'with valid params' do
      vote = Vote.create(post_id: post.id, user_id: user.id)
      expect(vote).to be_valid
    end

    it 'when belongs to user' do
    	assc = described_class.reflect_on_association(:user)
    	expect(assc.macro).to eq :belongs_to
    end
    it 'when belongs to post' do
    	assc = described_class.reflect_on_association(:post)
    	expect(assc.macro).to eq :belongs_to
    end
    #it { should belong_to(:user) } #gem shoulda
  end
  context 'is invalid' do
    it 'without user_id' do
      vote = Vote.create(post_id: post.id)
      expect(vote).not_to be_valid
    end
    it 'without post_id' do
      vote = Vote.create(user_id: user.id)
      expect(vote).not_to be_valid
    end
    it 'when user not unique' do
      vote = Vote.create(user_id: user.id, post_id: post.id)
      expect(vote.dup).not_to be_valid
    end
  end
 end