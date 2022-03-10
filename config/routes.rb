Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/me', to: 'users#show'

  resources :users, only: [:create, :index, :show]

  #do I need more resources on restaurants? Users can't add or delete them, will come from seed
  resources :restaurants, only: [:index, :show]

end
