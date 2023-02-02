
class HomeController < ApplicationController
    def index
      def index
        user = current_user.followed_users.ids
        @posts = Post.where(user_id: user)
        @stories = Story.where(user_id: user)
      end
    end
  end
  