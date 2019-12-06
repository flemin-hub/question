class FiguresController < ApplicationController
    
    
    def new
      @post = Post.find_by(id: params[:id])
      
      @agree = Agree.where(post_id: @post.id).count
      @disagree = Disagree.where(post_id: @post.id).count
      
      @data = {'Yes' => @agree, 'No' => @disagree}
  
    end
    
    def yes_create
        
      @post = Post.find_by(id: params[:id])
      @agree = Agree.new(post_id: @post.id)
      @agree.save
      redirect_to("/posts/#{@post.id}/result")
    end
    
    def no_create
      @post = Post.find_by(id: params[:id])
      @disagree = Disagree.new(post_id: @post.id)
      @disagree.save
      redirect_to("/posts/#{@post.id}/result")
    end
    
    def destroy
      @post = Post.find_by(id: params[:id])
      @agree = Agree.where(post_id: @post.id).destroy_all
      @disagree = Disagree.where(post_id: @post.id).destroy_all

      redirect_to("/posts/#{@post.id}/result")
    end
    
end
