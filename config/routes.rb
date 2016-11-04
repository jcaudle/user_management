Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index, :show, :update]
  end

  resources :things
  devise_for :users
  root to: 'home#index'
end
