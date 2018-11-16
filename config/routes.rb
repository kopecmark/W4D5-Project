Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resource :sessions, only: [:new, :create, :destroy]
end
