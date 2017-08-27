require 'rails_helper'

describe Admin::PostsController do
  render_views

  before do
    sign_in FactoryGirl.create(:user)
  end

  let(:post) { FactoryGirl.create(:post, title: 'Some post', subtitle: 'Some subtitle', content: 'Some content') }

  describe "GET index" do
    before do
      post
    end

    it "returns 200" do
      get :index
      expect(response.status).to eql(200)
    end

    it "returns posts" do
      get :index
      expect(response.body).to match(/Some post/)
    end
  end
end