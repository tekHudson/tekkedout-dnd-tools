Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "races#index"

  resources :classes, only: [:index]
  resources :races, only: [:index]

  resources :spells, only: [:index]
end
