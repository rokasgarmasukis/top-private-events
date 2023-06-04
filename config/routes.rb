Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'events#index'

  get '/user', to: 'user#show'

  resources :events
  resources :event_attendences, only: %i[create destroy]
end
