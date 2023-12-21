Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  get '/logpass', to: 'logpass#index'
  root "pages#index"
end
