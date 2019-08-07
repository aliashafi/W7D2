Rails.application.routes.draw do

  # get 'sessions/new'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resource :sessions, only: [:new, :create, :destroy]

  resources :bands do 
    resources :albums, only: [:new]
  end

  resources :albums do 
    resource :tracks, only: [:new, :create, :show]
  end

  # resource :tracks
  
end
