Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bookmarks do
    member do
      post :like
    end
  end
end
