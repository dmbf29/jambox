Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookmarks, only: [:index, :new]
  resources :artists, only: [] do
    collection do
      get :search
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bookmarks do
        member do
          post :like
        end
      end
    end
  end
  get '/auth/spotify/callback', to: 'users#spotify'
end
