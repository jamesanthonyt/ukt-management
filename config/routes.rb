Rails.application.routes.draw do
  root 'theatres#index'

  resources :theatres do
    resources :performance_spaces
  end
end
