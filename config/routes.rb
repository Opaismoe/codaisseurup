Rails.application.routes.draw do
  root to: "pages#home"
  root to: "events#index"


  devise_for :users

  get "about" => "pages#about"

  resources :users
  resources :photos
  resources :categories
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.

  namespace :api do
    resources :events do
      resources :registrations, only: [:create, :update]
    end
  end
end
