# frozen_string_literal: true
Rails.application.routes.draw do
  get 'see_user/All'
  get 'see_user/ShowYou'
  get 'calc/input'
  get 'calc/view'
  devise_for :users
  # get '/users/edit', as: :devise/registrations/edit
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: 'calc#input'
  end