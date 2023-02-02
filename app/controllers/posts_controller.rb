
class PostsController < ApplicationController
    before_action :set_params, only: %i[edit destroy]
    def index
      @posts = Post.all
    end
  
    def new

      @post = Post.new
    end
  
    def create
  
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to posts_path
      else
        flash[:alert] = 'Post creation failed'
      end
    end
  
    def show
        @post = Post.find_by(id: params[:id])
      end
      
    def destroy
   
      if @post.destroy
        flash[:notice] = 'post deleted'
        redirect_to posts_path
      else
        flash[:alert] = 'Cant destroy'
      end
    end
  
  
  
    private
  
    def post_params
      params.require(:post).permit(:title, :description, :user_id, images: [])
    end
  
    def set_params
      @post = Post.find(params[:id])
    end
  end
  