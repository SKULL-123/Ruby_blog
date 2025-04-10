class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find_by!(slug: params[:slug])
    if @post.nil?
      redirect_to root_path, alert: "Статья не найдена"
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params) # Привязываем пост к текущему пользователю

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private

  # Ищем пост перед редактированием/удалением
  def set_post
    @post = Post.find_by!(slug: params[:slug])
  end

  # Проверяем, является ли пользователь автором
  def authorize_user!
    redirect_to posts_path, alert: "Нет доступа!" unless @post.user == current_user
  end

  # Разрешаем передавать только нужные параметры
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end
end
