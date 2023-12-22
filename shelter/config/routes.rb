Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/lks', to: 'lks#index'
  root to: "home#index"
end
