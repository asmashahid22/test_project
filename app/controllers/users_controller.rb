
class UsersController < ApplicationController
  before_action :set_user, only: %i[show follow unfollow accept_request reject_request remove_follow_request]
  def index
    @users = User.page(params[:page])
  end

  def show
    @stories = @user.stories
    @posts = @user.posts
  end

  def follow
    if @user.public_account?
      @user.follower_users << current_user
      flash[:alert] = 'Followed'
    else
      @user.sending_users << current_user
      flash[:alert] = 'Requested'
    end
    redirect_to users_path
  end

  def unfollow
    if @user.follower_users.delete(current_user)
      flash[:alert] = 'unfollowed'
      redirect_to users_path
    end
  end

  def accept_request
    current_user.follower_users << @user
    authorize @user
    if Request.delete_request(@user.id, current_user.id)
      flash[:notice] = 'request accepted'
      redirect_to users_path
    end
  end

  def reject_request
    authorize @user
    if Request.delete_request(@user.id, current_user.id)
      flash[:notice] = 'request rejected'
      redirect_to users_path
    end
  end

  def remove_follow_request
    authorize @user
    if Request.delete_request(current_user.id, @user.id)
      flash[:notice] = 'request removed'
      redirect_to users_path
    end
  end

  def search
    @parameter = params[:search].downcase
    @results = User.all.where('username LIKE :search', search: "%#{@parameter}%")
    end

  private

  def set_user
    @user = User.find(params[:id])
  end
  end
  