Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "spells#index"

  resources :combatants, only: [:create, :update, :destroy]

  resources :combat_trackers, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get :deleted
    end
  end

  resources :creatures, only: [:index]

  resources :klasses, only: [:index]

  resources :races, only: [:index]

  resources :spells, only: [:index, :search]
end
