

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]
  def create
    if @like = @post.likes.create(user_id: current_user.id)
     
      flash[:notice] = 'Like created'
      redirect_to request.referer
    else
      flash[:notice] = 'Cant like the post'
    end
  end

  def destroy
  
    if @like.destroy
      flash[:notice] = 'Unliked'
      redirect_to request.referer
    else
      flash[:notice] = 'Cannot unlike the post'
    end
  end
 

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
