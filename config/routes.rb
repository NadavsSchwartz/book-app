Rails.application.routes.draw do
  resources :reviews
  resources :users

  post '/signin', to: 'sessions#create'

  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
