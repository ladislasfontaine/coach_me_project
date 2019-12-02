Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  root to: "users#welcome"
  resources :users

end
