Rails.application.routes.draw do
  root 'theatres#index'

  resources :theatres do
    resources :performance_spaces
    resources :af_venues, only: :index do
      collection do
        put :map_performance_space
      end
    end
  end
end
