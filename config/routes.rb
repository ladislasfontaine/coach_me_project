# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :coaches
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :coaches
  resources :users
  resources :seances
  resources :objectives
  root to: 'users#welcome'

  get '/contacts', to: 'statics#contacts'
  get '/cgv', to: 'statics#cgv'
  get '/cgu', to: 'statics#cgu'
  get '/about', to: 'statics#about'
  get '/welcome', to: 'statics#welcome'
end
