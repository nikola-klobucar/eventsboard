Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'
    resources :users, only: [:index]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  devise_for :users
    root 'events#index'
    resources :events do
        resources :comments, only: [:create]
    end
    resources :users, only: [:show]
    resources :categories, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
