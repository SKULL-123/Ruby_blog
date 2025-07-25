class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by!(slug: params[:slug])
    if @post.nil?
      redirect_to root_path, alert: "Статья не найдена"
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params) 

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private

  def set_post
    @post = Post.find_by!(slug: params[:slug])
  end

  def authorize_user!
    redirect_to posts_path, alert: "Нет доступа!" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
end
