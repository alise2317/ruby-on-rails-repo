Rails.application.routes.draw do
  devise_for :users
  get '/authorization', to: 'authorization#index'
  root to: "home#index"
end
