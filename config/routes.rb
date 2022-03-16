Rails.application.routes.draw do
  root "events#index"

  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "user", to: "users#show"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"

  resources :events
  resources :event_attendings, only: %i[create destroy]
end
