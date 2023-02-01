
class UsersController < ApplicationController
    def search
      @parameter = params[:search].downcase
      @results = User.all.where('username LIKE :search', search: "%#{@parameter}%")
      end 
  end
  