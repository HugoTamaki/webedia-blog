require 'rails_helper'
require 'rack/test'

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

    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "returns 200" do
      get :new
      expect(response.status).to eql(200)
    end

    it "returns new post template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "success" do
      it "returns 302" do
        post :create, params: {
          post: {
            title: 'Some title',
            subtitle: 'Some subtitle',
            content: 'Some content',
            image: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'image.jpg'), "image/jpeg")
          }
        }
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

  describe "GET edit" do
    it "returns 200" do
      get :edit, params: { id: post_sample }
      expect(response.status).to eql(200)
    end

    it "returns edit template" do
      get :edit, params: { id: post_sample }
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update" do
    context "success" do
      it "updates post" do
        put :update, params: { id: post_sample, post: { title: 'Other title' } }
        expect(post_sample.reload.title).to eql('Other title')
      end

      it "returns 302" do
        put :update, params: { id: post_sample, post: { title: 'Other title' } }
        expect(response.status).to eql(302)
      end

      it "sends user to posts index" do
        put :update, params: { id: post_sample, post: { title: 'Other title' } }
        expect(response).to redirect_to(admin_posts_url)
      end
    end
  end

  context "fail" do
    it "returns 400" do
      put :update, params: { id: post_sample, post: { title: nil } }
      expect(response.status).to eql(400)
    end

    it "re renders edit" do
      put :update, params: { id: post_sample, post: { title: nil } }
      expect(response).to render_template(:edit)
    end
  end
end