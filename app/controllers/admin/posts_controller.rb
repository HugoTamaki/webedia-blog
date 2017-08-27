module Admin
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to admin_posts_path, notice: "Post criado com sucesso!"
      else
        render :new, alert: "Verifique os campos e tente novamente.", status: :bad_request
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :subtitle, :content)
    end
  end
end
