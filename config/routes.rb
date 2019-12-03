Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  resources :coaches
  resources :users 
  resources :seances
   
  root to: "users#welcome"
end
