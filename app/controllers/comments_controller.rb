
class CommentsController < ApplicationController
    before_action :set_post, only: %i[create destroy edit]
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = @post.comments.create(comment_params)
      if @comment.save
        flash[:notice] = 'Comment created'
        redirect_to request.referer
      else
        flash[:alert] = 'Cant create comment'
      end
    end
  
    def destroy
      @comment = @post.comments.find(params[:id])
      
      if @comment.destroy
        flash[:alert] = 'Deleted Comment'
        redirect_to request.referer
      else
        flash[:info] = 'Deletion failed'
      end
    end

   
    private
  
    def comment_params
      params.require(:comment).permit!
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  end