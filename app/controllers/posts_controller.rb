class PostsController < ApplicationController
  
  before_action :admin_user, {only: [:new, :create, :destroy]}
  

  def index
     @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @agree = Agree.find_by(user_id: @current_user.id, post_id: @post.id)
    @disagree = Disagree.new(post_id: @post.id, user_id: @current_user.id)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
