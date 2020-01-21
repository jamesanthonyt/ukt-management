Rails.application.routes.draw do
  resources :theatres do
    resources :performance_spaces
  end
end
