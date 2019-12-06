Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  resources :coaches
  resources :users
  resources :seances
  root to: "users#welcome"
    get "/contacts", to: 'statics#contacts'
    get "/cgv", to: 'statics#cgv'
    get "/about", to: 'statics#about'
end
