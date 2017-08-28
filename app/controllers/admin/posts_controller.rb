module Admin
  class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = Post.order(:created_at).page params[:page]
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

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to admin_posts_path, notice: "Post editado com sucesso!"
      else
        render :edit, alert: "Verifique os campos e edite novamente.", status: :bad_request
      end
    end

    def destroy
      @post = Post.find(params[:id])

      if @post.destroy
        redirect_to admin_posts_path, notice: "Post apagado com sucesso."
      else
        redirect_to admin_posts_path, alert: "Não foi possível apagar o post."
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :subtitle, :image, :content)
    end
  end
end
