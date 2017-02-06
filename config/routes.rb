Rails.application.routes.draw do
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  # get 'users/new'
  #
  # get 'users/create'

  # get 'products/index'
  #
  # get 'products/show'
  #
  # get 'products/new'
  #
  # get 'products/edit'
  resources :products
  resources :users, only: [:new, :create]
  resources :sessions, only: %i(new create destroy)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
