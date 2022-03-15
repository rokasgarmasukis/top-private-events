Rails.application.routes.draw do
  root "events#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "events#index"
end
