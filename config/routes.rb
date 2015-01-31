Payrent::Application.routes.draw do
  #get "users/index"
  #get "users/show"
  #get "users/new"
  #get "users/edit"

  #resources :users

  resources :payments

  resources :units

  resources :utility_charges

  resources :properties

  devise_for :users

  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'

end
