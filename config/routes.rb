Rails.application.routes.draw do

  devise_for :coaches
  devise_for :users
  resources :coaches
  root to: "users#welcome"
  resources :users do
    resources :avatars, only: [:create]
  end

end
