Rails.application.routes.draw do
  post '/add_to_favorites', to: 'home#add_to_favorites'
  post '/delete', to: 'home#delete'
  post '/show', to: 'lks#show'
  resources :cards, only: [:create]
  devise_for :admins
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  post '/create_card', to: 'cards#create'
  get '/lks', to: 'lks#index'
  root to: "home#index"
end
