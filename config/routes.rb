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

  #root :to => 'admin#index', :constraints => RoleConstraint.new(:admin) #matches this route when the current user is an admin
  #root :to => 'sites#index', :constraints => RoleConstraint.new(:user) #matches this route when the current user is an user
  #root :to => 'welcome#index' #matches this route when the above two matches don't pass

end
