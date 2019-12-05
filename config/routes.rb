Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  resources :coaches
  resources :users 
  resources :seances
  resources :objectives #, only: [:show, :edit, :update, :destroy]
   
  root to: "users#welcome"
end
