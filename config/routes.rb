Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts do
    resources :likes, only:   [:create, :destroy]
    resources :comments, only:   [:new,:create, :destroy]
  end
  resources :stories, except:   [:edit, :update]
  get '/search', to: 'users#search'
end
