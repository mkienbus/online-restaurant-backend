Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/me', to: 'users#show'

  resources :users, only: [:create, :index, :show]

  resources :restaurants, only: [:index, :show, :update]

  resources :reservations, only: [:index, :create, :update, :destroy]

  resources :favorites

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/favorites', to: 'favorites#favorites'
  get '/favorites', to: 'favorites#index'

end
