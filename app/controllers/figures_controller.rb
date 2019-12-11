class FiguresController < ApplicationController
  
    before_action :admin_user2, {only: [:destroy]}
    
    
    def new
      @post = Post.find_by(id: params[:id])
      
      @agree = Agree.where(post_id: @post.id).count
      @disagree = Disagree.where(post_id: @post.id).count
      
      @data = {'Yes' => @agree, 'No' => @disagree}
      
      if Agree.find_by(user_id: @current_user.id, post_id: @post.id)
        @message = "あなたの回答はYESです"
      else
        @message = "あなたの回答はNOです"
      end
  
    end
    
    def yes_create
      
      @post = Post.find_by(id: params[:id])
      @agree = Agree.new(post_id: @post.id, user_id: @current_user.id)
      @agree.save
      
      
      redirect_to("/posts/#{@post.id}/result")
    end
    
    def no_create
      
      @post = Post.find_by(id: params[:id])
      @disagree = Disagree.new(post_id: @post.id, user_id: @current_user.id)
      @disagree.save
      redirect_to("/posts/#{@post.id}/result")
    end
    
    def destroy
      @post = Post.find_by(id: params[:id])
      @agree = Agree.where(post_id: @post.id).destroy_all
      @disagree = Disagree.where(post_id: @post.id).destroy_all
      

      redirect_to("/posts/#{@post.id}/result")
    end
    
  def admin_user2
    @post = Post.find_by(id: params[:id])
    unless @current_user.admin?
      flash[:notice] = "権限がありません"
      redirect_to("/posts/#{@post.id}/result")
    
    end
  end
    
end
