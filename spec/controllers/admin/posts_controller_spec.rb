require 'rails_helper'

describe Admin::PostsController do
  render_views

  before do
    sign_in FactoryGirl.create(:user)
  end

  let(:post_sample) { FactoryGirl.create(:post, title: 'Some post', subtitle: 'Some subtitle', content: 'Some content') }

  describe "GET index" do
    before do
      post_sample
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

  describe "POST create" do
    context "success" do
      it "returns 302" do
        post :create, params: { post: {title: 'Some title', subtitle: 'Some subtitle', content: 'Some content'} }
        expect(response.status).to eql(302)
      end
    end

    context "fail" do
      it "returns 400" do
        post :create, params: { post: {title: nil, subtitle: nil, content: nil} }
        expect(response.status).to eql(400)
      end
    end

  end
end