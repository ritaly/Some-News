require 'rails_helper'

describe Post do
  let(:post) { FactoryGirl.build(:post)}

  context 'is valid' do
    it 'with valid params' do
      expect(post).to be_valid
    end
    it 'can have many comments' do

      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it { should have_many(:votes) }
    it { should have_many(:upvoting_users) }
    it { should belong_to(:user) }
  end
  context 'is invalid' do
    it 'without title' do
      post.title = nil
      expect(post).not_to be_valid
    end
    it 'without text' do
      post.text = nil
      expect(post).not_to be_valid
    end
    it 'without user' do
      post.user_id = nil
      expect(post).not_to be_valid
    end
  end
end

#dodac gem factory girl - co robi, dlaczego chcemy, zastosowac
