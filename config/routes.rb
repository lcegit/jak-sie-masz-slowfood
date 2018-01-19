Rails.application.routes.draw do

  root controller: :restaurant, action: :index
  resources :restaurant, only: [:show, :create]
  resources :orders, only: [:create, :update]
end
