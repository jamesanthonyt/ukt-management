Rails.application.routes.draw do
  root 'theatres#index'

  resources :theatres, except: :destroy do
    resources :performance_spaces, except: :destroy
    resources :af_venues, only: :index do
      collection do
        put :map_performance_space
      end
    end
  end
end
