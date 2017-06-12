Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "races#index"

  resources :combat_trackers, only: [:index]
  resources :characters, only: [:create, :update, :destroy]
  resources :klasses, only: [:index]
  resources :races, only: [:index]
  resources :spells, only: [:index, :search]
end
