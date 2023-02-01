
class StoriesController < ApplicationController
    def index
      @stories = Story.all
    end
  
    def new
    
      @story = Story.new
    end
  
    def create
     
      if @story = current_user.stories.create(story_params)
        flash[:notice] = 'Story Created'
        redirect_to stories_path
      else
        flash[:notice] = 'Story Creation failed'
      end
    end
  
    def destroy
      @story = Story.find(params[:id])
      if @story.destroy
        flash[:notice] = 'Story deleted'
        redirect_to root_path
      else
        flash[:notice] = 'Story deletion failed'
      end
    end
  
    private
  
    def story_params
      params.require(:story).permit(:image)
    end
  end
  