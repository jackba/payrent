Payrent::Application.routes.draw do
  resources :utility_charges

  resources :properties

  devise_for :users
  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'
end
