Rails.application.routes.draw do
  root 'theatres#index'

  resources :theatres do
    resources :performance_spaces
    resources :af_venues, only: [:edit, :update]

  end
end
