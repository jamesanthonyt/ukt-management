Rails.application.routes.draw do
  root 'theatres#index'

  resources :theatres, except: :destroy do
    resources :performance_spaces, except: [:index, :destroy]
    resources :af_venues, only: :show do
      resources :af_venue_mappings, only: [:destroy, :create, :new]
    end
  end
end
