Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts do
    resources :likes, only:   [:create, :destroy]
    resources :comments, only:   [:new,:create, :destroy]
  end
  resources :stories, except:   [:edit, :update]
  get '/search', to: 'users#search'

  resources :users do
    member do
      post :follow
      delete :unfollow
      post :accept_request
      delete :reject_request
      delete :remove_follow_request

    end
    collection do
      get :friend_requests
    end
  end 
end
