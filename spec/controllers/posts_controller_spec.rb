require 'spec_helper'

describe PostsController do
  describe 'GET #index' do
    let(:post) { FactoryGirl.create(:post)}

    it 'renders json with posts list' do
      post
      get :index
      expect(response.status).to eq 200
      # na zaś: poczytać o helperach w speckach
      # zrobić tak żeby mozna bylo uzyc
      # expect(parsed_response).should whatever
      binding.pry
      expect(JSON.parse(response.body)).should eq([post.to_json])
    end
  end
end