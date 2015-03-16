Payrent::Application.routes.draw do

  get "/admin" => "admin#index"

  resources :paid_rents

  resources :payments

  resources :units

  resources :utility_charges

  resources :properties

  resources :stripe_charges, only: [:new, :create]

  devise_for :users
  resources :users, only: [:update, :index]

  get "welcome/index"
  get "welcome/about"
  get "welcome/brookview"
  get "welcome/highland"
  get "welcome/thirteenth"
  get "welcome/hutton"

  root to: 'welcome#index'

end
