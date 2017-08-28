class HomeController < ApplicationController
  def index
    @posts = Post.order(:created_at).page params[:page]
  end
end
