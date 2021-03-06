Rails.application.routes.draw do
  root to: 'static#index'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  get 'auth/google_oauth2/callback', to: 'sessions#google'
  resources :users, except: [:new]

  resources :books do
    resources :reviews, shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
