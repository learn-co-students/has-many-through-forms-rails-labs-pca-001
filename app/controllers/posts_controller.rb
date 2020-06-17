require 'pry'

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @categories = @post.categories
    @comments = @post.comments
    @comment = Comment.new
    @user = User.new
    @users = @comments.map(&:user).uniq
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    @post.categories.build
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
