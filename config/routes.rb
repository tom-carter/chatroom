Rails.application.routes.draw do
  devise_for :users

  root to: "chat#index"

  resources :messages, only: [:create]
end
