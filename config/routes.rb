Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  resources :coaches
  resources :users
  resources :seances
  resources :objectives
  root to: "users#welcome"
  
    get "/contacts", to: 'statics#contacts'
    get "/cgv", to: 'statics#cgv'
    get "/cgu", to: 'statics#cgu'
    get "/about", to: 'statics#about'
end
