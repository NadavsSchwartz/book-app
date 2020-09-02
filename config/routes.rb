Rails.application.routes.draw do
  resources :users

  post '/signin', to: 'sessions#create'



  resources :books do
    resources :reviews, shallow: true
  end

  resources :authors do
    resources :books, shallow: true
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
