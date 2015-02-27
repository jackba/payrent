Payrent::Application.routes.draw do
  #get "paid_rent/index"
  #get "paid_rent/new"
  #get "paid_rent/create"
  get "/admin" => "admin#index"
  #get "users/index"
  #get "users/show"
  #get "users/new"
  #get "users/edit"

  resources :paid_rents

  resources :payments

  resources :units

  resources :utility_charges

  resources :properties

  resources :stripe_charges, only: [:new, :create]

  devise_for :users
  resources :users, only: [:update]

  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'

  #root :to => 'admin#index', :constraints => RoleConstraint.new(:admin) #matches this route when the current user is an admin
  #root :to => 'sites#index', :constraints => RoleConstraint.new(:user) #matches this route when the current user is an user
  #root :to => 'welcome#index' #matches this route when the above two matches don't pass

end
