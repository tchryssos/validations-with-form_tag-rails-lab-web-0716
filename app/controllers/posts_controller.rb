class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :update, :show]
  def show
  end

  def create
    @post=Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def index
  end

  def new
    @post=Post.new(post_params)
  end

  def update

    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post
    @post=Post.find(params[:id])
  end
end
