class BlogPostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
    @blog_posts = Blogpost.all
  end

  def new
    @blog_post = Blogpost.new
  end

  def show
  end

  def create
    @blog_post = Blogpost.new(blog_post_params)
    if @blog_post.save
      redirect_to blog_post_url(@blog_post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to blog_post_url(@blog_post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end
  def blog_post_params
    params.require(:blogpost).permit(:title, :body)
  end

  def set_blog_post
    @blog_post = Blogpost.find(params[:id])
    begin
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def authenticate_user!
    redirect_to new_user_session_path, alert: "You must be signed in" unless user_signed_in?
    end
end